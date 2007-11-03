/* 
 * Copyright (C) 2005,2006,2007 MaNGOS <http://www.mangosproject.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef MANGOS_LOOTMGR_H
#define MANGOS_LOOTMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include "ItemPrototype.h"
#include "ItemEnchantmentMgr.h"
#include "ByteBuffer.h"
#include "Util.h"

#include <map>
#include <vector>

enum RollType
{
    ROLL_PASS         = 0,
    ROLL_NEED         = 1,
    ROLL_GREED        = 2
};

#define MAX_NR_LOOT_ITEMS 16
// note: the client cannot show more than 16 items total
#define MAX_NR_QUEST_ITEMS 32
// unrelated to the number of quest items shown, just for reserve

enum LootMethod
{
    FREE_FOR_ALL      = 0,
    ROUND_ROBIN       = 1,
    MASTER_LOOT       = 2,
    GROUP_LOOT        = 3,
    NEED_BEFORE_GREED = 4
};

enum PermissionTypes
{
    ALL_PERMISSION    = 0,
    GROUP_PERMISSION  = 1,
    NONE_PERMISSION   = 3
};

enum AdditionalLootCondition
{   //QuestFFAorLootCondition < 0 (negative) condition_value1 condition_value2
    CONDITION_NONE                  = 0,    // 0 0
    CONDITION_AURA                  = 1,    // spell_id effindex
    CONDITION_ITEM                  = 2,    // item_id count
    CONDITION_ITEM_EQUIPPED         = 3,    // item_id 0
    CONDITION_ZONEID                = 4,    // zone_id 0
    CONDITION_REPUTATION_RANK       = 5,    // faction_id min_rank
    CONDITION_TEAM                  = 6     // player_team 0
                                            // 469 - Alliance 67 - Horde
};


class Player;

struct LootStoreItem
{
    uint32  itemid;
    uint32  displayid;
    float   chanceOrRef;
    int32   questChanceOrGroup;
    uint8   mincount;
    uint8   maxcount;
    int8 ffa_or_condition; // free for all or additional loot condition
    uint32 cond_value1;
    uint32 cond_value2;

    LootStoreItem()
        : itemid(0), displayid(0), chanceOrRef(0), questChanceOrGroup(0), mincount(1), maxcount(1), ffa_or_condition(1), cond_value1(0), cond_value2(0) {}

    LootStoreItem(uint32 _itemid, uint32 _displayid, float _chanceOrRef, int32 _questChanceOrGroup, int8 _ffa_or_condition = 1, uint32 _cond_value1 = 0, uint32 _cond_value2 = 0, uint8 _mincount = 1, uint8 _maxcount = 1)
        : itemid(_itemid), displayid(_displayid), chanceOrRef(_chanceOrRef), questChanceOrGroup(_questChanceOrGroup), mincount(_mincount), maxcount(_maxcount), ffa_or_condition(_ffa_or_condition), cond_value1(_cond_value1), cond_value2(_cond_value2) {}

    int32 GetGroupId() const { return -questChanceOrGroup -1; }
};

struct LootItem
{
    uint32  itemid;
    uint32  displayid;
    uint32  randomSuffix;
    int32   randomPropertyId;
    uint8   count      : 8;                                 // allow compiler pack structure
    bool    is_looted  : 1;
    bool    is_blocked : 1;
    uint8 ffa_or_condition : 1;

    LootItem()
        : itemid(0), displayid(0), randomSuffix(0), randomPropertyId(0), count(1), is_looted(true), is_blocked(false), ffa_or_condition(1) {}

    LootItem(uint32 _itemid, uint32 _displayid, uint32 _randomSuffix, int32 _randomProp, uint8 _ffa_or_condition, uint8 _count = 1)
        : itemid(_itemid), displayid(_displayid), randomSuffix(_randomSuffix), randomPropertyId(_randomProp), count(_count), is_looted(false), is_blocked(false), ffa_or_condition(_ffa_or_condition) {}

    LootItem(LootStoreItem const& li,uint8 _count, uint32 _randomSuffix = 0, int32 _randomProp = 0)
        : itemid(li.itemid), displayid(li.displayid), randomSuffix(_randomSuffix), randomPropertyId(_randomProp), count(_count), is_looted(false), is_blocked(false), ffa_or_condition(li.ffa_or_condition) {}

    static bool looted(LootItem &itm) { return itm.is_looted; }
    static bool not_looted(LootItem &itm) { return !itm.is_looted; }
};

struct QuestItem
{
    uint8   index;                                          // position in quest_items;
    bool    is_looted;

    QuestItem()
        : index(0), is_looted(false) {}

    QuestItem(uint8 _index, bool _islooted = false)
        : index(_index), is_looted(_islooted) {}
};

typedef std::vector<QuestItem> QuestItemList;
typedef std::map<Player *, QuestItemList *> QuestItemMap;
typedef std::vector<LootStoreItem> LootStoreItemList;
typedef HM_NAMESPACE::hash_map<uint32, LootStoreItemList > LootStore;

struct Loot
{
    std::set<uint64> PlayersLooting;
    QuestItemMap PlayerQuestItems;
    std::vector<LootItem> items;
    std::vector<LootItem> quest_items;
    uint32 gold;
    uint8 unlootedCount;
    bool released;

    Loot(uint32 _gold = 0) : gold(_gold), unlootedCount(0), released(false) {}
    ~Loot() { clear(); }

    void clear()
    {
        items.clear(); gold = 0; PlayersLooting.clear();
        for (QuestItemMap::iterator itr = PlayerQuestItems.begin(); itr != PlayerQuestItems.end(); ++itr)
            delete itr->second;
        PlayerQuestItems.clear();
        quest_items.clear();
    }

    bool empty() const { return items.empty() && gold == 0; }
    bool isLooted();
    void NotifyItemRemoved(uint8 lootIndex);
    void NotifyQuestItemRemoved(uint8 questIndex);
    void NotifyMoneyRemoved();
    void AddLooter(uint64 GUID) { PlayersLooting.insert(GUID); }
    void RemoveLooter(uint64 GUID) { PlayersLooting.erase(GUID); }

    void generateMoneyLoot(uint32 minAmount, uint32 maxAmount);
};

struct LootView
{
    Loot &loot;
    QuestItemList *qlist;
    PermissionTypes permission;
    LootView(Loot &_loot, QuestItemList *_qlist, PermissionTypes _permission = ALL_PERMISSION)
        : loot(_loot), qlist(_qlist), permission(_permission) {}
};

extern LootStore LootTemplates_Creature;
extern LootStore LootTemplates_Fishing;
extern LootStore LootTemplates_Gameobject;
extern LootStore LootTemplates_Item;
extern LootStore LootTemplates_Pickpocketing;
extern LootStore LootTemplates_Skinning;
extern LootStore LootTemplates_Disenchant;
extern LootStore LootTemplates_Prospecting;

QuestItemList* FillQuestLoot(Player* player, Loot *loot);
void FillLoot(Loot* loot, uint32 loot_id, LootStore& store, Player* loot_owner);
void LoadLootTables();
void LoadLootTable(LootStore& lootstore,char const* tablename);

ByteBuffer& operator<<(ByteBuffer& b, LootItem const& li);
ByteBuffer& operator<<(ByteBuffer& b, LootView const& lv);
#endif
