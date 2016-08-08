--local zone = "Siege of Orgrimmar"
local zoneid = 953

-- Check Compatibility
local GridStatusRaidDebuff = GridStatusRaidDebuff;
local function import(self)

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--[[ʾ��
GridStatusRaidDebuff:DebuffId(zoneid, ����ID, ���, ���ȼ�1, ���ȼ�2, ʣ��ʱ��, �ѵ�����) --��������
��ŵ�1��Boss��1��ͷ���ڶ�����2��ͷ�����ĳ��Boss���ܹ��࣬�Զ�˳��
���ȼ�1��2���ó�һ���ļ��ɣ�����Gridֻ����ʾһ������ͼ�꣬���Ը����ȼ��Ḳ�ǵ������ȼ��ķ���
]]

--С��
GridStatusRaidDebuff:DebuffId(zoneid, 149207, 1, 1, 1, true, true) --��ʴ֮��
GridStatusRaidDebuff:DebuffId(zoneid, 145553, 1, 1, 1, true, true) --��¸
GridStatusRaidDebuff:DebuffId(zoneid, 147203, 1, 1, 1, true, true) --�Ϲ�
GridStatusRaidDebuff:DebuffId(zoneid, 147554, 1, 1, 1, true, true) --��ɷ��֮Ѫ

-- ��ī��˹
GridStatusRaidDebuff:BossNameId(zoneid, 10, "Immerseus")
GridStatusRaidDebuff:DebuffId(zoneid, 143297, 11, 5, 5) --ɷ���罦
GridStatusRaidDebuff:DebuffId(zoneid, 143459, 12, 4, 4, true, true) --ɷ�ܲ���
GridStatusRaidDebuff:DebuffId(zoneid, 143524, 13, 4, 4, true, true) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 143286, 14, 4, 4) --��͸ɷ��
GridStatusRaidDebuff:DebuffId(zoneid, 143413, 15, 3, 3) --����
GridStatusRaidDebuff:DebuffId(zoneid, 143411, 16, 3, 3) --����
GridStatusRaidDebuff:DebuffId(zoneid, 143436, 17, 2, 2, true, true) --��ʴ��� (̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143579, 18, 3, 3, true, true) --ɷ�ܸ�ʴ (������ģʽ)

-- ������ػ���
GridStatusRaidDebuff:BossNameId(zoneid, 20, "Fallen Protectors")
GridStatusRaidDebuff:DebuffId(zoneid, 143239, 21, 4, 4) --�����綾
GridStatusRaidDebuff:DebuffId(zoneid, 143301, 22, 2, 2, true, false) --���
GridStatusRaidDebuff:DebuffId(zoneid, 143010, 23, 3, 3) --ʴ�ǻ�����
GridStatusRaidDebuff:DebuffId(zoneid, 143434, 24, 6, 6, true, false) --���������� (��ɢ)
GridStatusRaidDebuff:DebuffId(zoneid, 143840, 25, 6, 6, true, false) --��ʹӡ��
GridStatusRaidDebuff:DebuffId(zoneid, 143198, 26, 6, 6) --����
GridStatusRaidDebuff:DebuffId(zoneid, 143959, 27, 4, 4) --���´��
GridStatusRaidDebuff:DebuffId(zoneid, 143423, 28, 6, 6) --ɷ������
GridStatusRaidDebuff:DebuffId(zoneid, 143292, 29, 5, 5) --����
GridStatusRaidDebuff:DebuffId(zoneid, 147383, 30, 4, 4, true, true) --˥��
--GridStatusRaidDebuff:DebuffId(zoneid, 143023, 31, 3, 3) --ʴ�Ǿƣ�������Ϊ����Ҫ
--GridStatusRaidDebuff:DebuffId(zoneid, 144176, 32, 5, 5, true, true) --��Ӱ������������Ϊ����Ҫ
--GridStatusRaidDebuff:DebuffId(zoneid, 143564, 33, 3, 3) --ڤ�����򣬸�����Ϊ����Ҫ


-- ŵ³ʲ
GridStatusRaidDebuff:BossNameId(zoneid, 40, "Norushen")
GridStatusRaidDebuff:DebuffId(zoneid, 146124, 41, 2, 2, true, true) --�Ի� (̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 146324, 42, 4, 4, true, true) --�ʼ�
GridStatusRaidDebuff:DebuffId(zoneid, 144849, 43, 4, 4) --�侲������
GridStatusRaidDebuff:DebuffId(zoneid, 144850, 44, 5, 5) --����������
GridStatusRaidDebuff:DebuffId(zoneid, 145861, 45, 6, 6) --���� (��ɢ)
GridStatusRaidDebuff:DebuffId(zoneid, 144851, 46, 2, 2) --���ŵ����� (̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 146703, 47, 3, 3) --�޵���Ԩ
GridStatusRaidDebuff:DebuffId(zoneid, 144514, 48, 6, 6) --������ʴ
--GridStatusRaidDebuff:DebuffId(zoneid, 144639, 49, 6, 6) --������������Ϊ����Ҫ

-- ��֮ɷ
GridStatusRaidDebuff:BossNameId(zoneid, 50, "Sha of Pride")
GridStatusRaidDebuff:DebuffId(zoneid, 144358, 51, 2, 2) --�������� (̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 144843, 52, 3, 3) --ѹ��
GridStatusRaidDebuff:DebuffId(zoneid, 146594, 53, 4, 4, true, false) --̩̹֮��
GridStatusRaidDebuff:DebuffId(zoneid, 144351, 54, 6, 6, true, true) --�������
GridStatusRaidDebuff:DebuffId(zoneid, 144364, 55, 4, 4, true, false) --̩̹֮��
GridStatusRaidDebuff:DebuffId(zoneid, 146822, 56, 6, 6) --ͶӰ
GridStatusRaidDebuff:DebuffId(zoneid, 146817, 57, 5, 5, true, false) --�����⻷
GridStatusRaidDebuff:DebuffId(zoneid, 144774, 58, 2, 2) --��չ��� (̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 144574, 59, 6, 6) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 145215, 60, 5, 5) --���� (������ģʽ)
GridStatusRaidDebuff:DebuffId(zoneid, 147207, 61, 4, 4) --��ҡ�ľ��� (������ģʽ)


-- ������˹
GridStatusRaidDebuff:BossNameId(zoneid, 70, "Galakras")
GridStatusRaidDebuff:DebuffId(zoneid, 146765, 71, 5, 5) --����֮��
GridStatusRaidDebuff:DebuffId(zoneid, 147705, 72, 5, 5) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 146902, 73, 2, 2, true, false) --�綾����
GridStatusRaidDebuff:DebuffId(zoneid, 147029, 74, 5, 5, true, true) --������¡֮��

-- ����սЫ
GridStatusRaidDebuff:BossNameId(zoneid, 80, "Iron Juggernaut")
GridStatusRaidDebuff:DebuffId(zoneid, 144467, 81, 2, 2, true, true) --ȼ�ջ���
GridStatusRaidDebuff:DebuffId(zoneid, 144459, 82, 5, 5, true, true) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 144498, 83, 5, 5) --���ѽ���
GridStatusRaidDebuff:DebuffId(zoneid, 144918, 84, 5, 5) --�и��
GridStatusRaidDebuff:DebuffId(zoneid, 146325, 84, 6, 6) --�и����׼���ص��أ�

-- �⿨¡�ڰ�����
GridStatusRaidDebuff:BossNameId(zoneid, 90, "Kor'kron Dark Shaman")
GridStatusRaidDebuff:DebuffId(zoneid, 144089, 91, 6, 6, true, true) --�綾֮��
GridStatusRaidDebuff:DebuffId(zoneid, 144215, 92, 2, 2, true, true) --��˪�籩���(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143990, 93, 2, 2) --��ˮ��ӿ(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 144304, 94, 2, 2, true, true) --˺��
GridStatusRaidDebuff:DebuffId(zoneid, 144330, 95, 6, 6, true, false) --��������(��Ӣ��ģʽ)

-- ���ȸ��ֽ���
GridStatusRaidDebuff:BossNameId(zoneid, 100, "General Nazgrim")
GridStatusRaidDebuff:DebuffId(zoneid, 143638, 101, 6, 6, true, true) --����ش�
GridStatusRaidDebuff:DebuffId(zoneid, 143480, 102, 5, 5) --�̿�ӡ��
GridStatusRaidDebuff:DebuffId(zoneid, 143431, 103, 6, 6, true, false) --ħ�����(��ɢ)
GridStatusRaidDebuff:DebuffId(zoneid, 143494, 104, 2, 2, true, true) --����ػ�(̹��) 
GridStatusRaidDebuff:DebuffId(zoneid, 143882, 105, 7, 7) --����ӡ��

-- ������޿�
GridStatusRaidDebuff:BossNameId(zoneid, 110, "Malkorok")
GridStatusRaidDebuff:DebuffId(zoneid, 142863, 111, 5, 5) --�������Ϲ�����
GridStatusRaidDebuff:DebuffId(zoneid, 142864, 112, 5, 5) --�Ϲ�����
GridStatusRaidDebuff:DebuffId(zoneid, 142865, 113, 5, 5) --ǿ����Ϲ�����
GridStatusRaidDebuff:DebuffId(zoneid, 142990, 114, 2, 2, true, true) --�������(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 142913, 115, 6, 6) --ɢ������ (��ɢ)
GridStatusRaidDebuff:DebuffId(zoneid, 143919, 116, 4, 4) --���� (��Ӣ��ģʽ)


-- �˴�����ս��Ʒ
GridStatusRaidDebuff:BossNameId(zoneid, 120, "Spoils of Pandaria")
GridStatusRaidDebuff:DebuffId(zoneid, 144853, 121, 3, 3, true, true) --Ѫ��˺ҧ
GridStatusRaidDebuff:DebuffId(zoneid, 145987, 122, 5, 5) --����ը��
GridStatusRaidDebuff:DebuffId(zoneid, 145218, 123, 4, 4, true, true) --Ӳ��Ѫ��
GridStatusRaidDebuff:DebuffId(zoneid, 145230, 124, 1, 1) --����ħ��
GridStatusRaidDebuff:DebuffId(zoneid, 146217, 125, 4, 4) --Ͷ����Ͱ
GridStatusRaidDebuff:DebuffId(zoneid, 146235, 126, 4, 4) --����֮Ϣ
GridStatusRaidDebuff:DebuffId(zoneid, 145523, 127, 4, 4) --����
GridStatusRaidDebuff:DebuffId(zoneid, 142983, 128, 6, 6, true, true) --��ĥ
GridStatusRaidDebuff:DebuffId(zoneid, 145715, 129, 3, 3) --����ը��
GridStatusRaidDebuff:DebuffId(zoneid, 145747, 130, 5, 5) --Ũ����Ϣ��
GridStatusRaidDebuff:DebuffId(zoneid, 146289, 131, 4, 4, true, true) --����̱��
--GridStatusRaidDebuff:DebuffId(zoneid, 145685, 132, 2, 2) --���ȶ��ķ���ϵͳ����˵����Ҫ

-- ��Ѫ������
GridStatusRaidDebuff:BossNameId(zoneid, 140, "Thok the Bloodthirsty")
GridStatusRaidDebuff:DebuffId(zoneid, 143766, 141, 2, 2, true, true) --�ֻ�(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143773, 142, 2, 2, true, true) --������Ϣ(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143452, 143, 1, 1) --��Ѫ����
GridStatusRaidDebuff:DebuffId(zoneid, 146589, 144, 5, 5) --����Կ��(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143445, 145, 6, 6, true, false) --����
GridStatusRaidDebuff:DebuffId(zoneid, 143791, 146, 5, 5, true, true) --��ʴ֮Ѫ
GridStatusRaidDebuff:DebuffId(zoneid, 143777, 147, 3, 3) --����(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143780, 148, 4, 4, true, true) --������Ϣ
GridStatusRaidDebuff:DebuffId(zoneid, 143800, 149, 5, 5, true, true) --����֮Ѫ
GridStatusRaidDebuff:DebuffId(zoneid, 143428, 150, 4, 4) --��βɨ��

-- ���ǽ�ʦ����
GridStatusRaidDebuff:BossNameId(zoneid, 160, "Siegecrafter Blackfuse")
GridStatusRaidDebuff:DebuffId(zoneid, 144236, 161, 4, 4) --ͼ��ʶ��
GridStatusRaidDebuff:DebuffId(zoneid, 143385, 162, 2, 2, true, true) --��ɳ��(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143856, 163, 6, 6, true, true) --����
--GridStatusRaidDebuff:DebuffId(zoneid, 144466, 164, 5, 5) --�����,ȫ��debuff������Ϊ������ʾ

-- ��������Ӣ��
GridStatusRaidDebuff:BossNameId(zoneid, 170, "Paragons of the Klaxxi")
GridStatusRaidDebuff:DebuffId(zoneid, 142948, 171, 5, 5, true, true) --��׼
GridStatusRaidDebuff:DebuffId(zoneid, 143702, 172, 5, 5) --��ͷת��
GridStatusRaidDebuff:DebuffId(zoneid, 142808, 173, 6, 6) --�׽�
GridStatusRaidDebuff:DebuffId(zoneid, 142931, 174, 2, 2, true, true) --Ѫ����¶
GridStatusRaidDebuff:DebuffId(zoneid, 143735, 175, 6, 6) --��ʴ����
GridStatusRaidDebuff:DebuffId(zoneid, 146452, 176, 5, 5) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 142929, 177, 2, 2, true, true) --�������
GridStatusRaidDebuff:DebuffId(zoneid, 142797, 178, 5, 5) --�綾����
GridStatusRaidDebuff:DebuffId(zoneid, 143939, 179, 5, 5) --���
GridStatusRaidDebuff:DebuffId(zoneid, 143275, 180, 2, 2, true, true) --�ӿ�
GridStatusRaidDebuff:DebuffId(zoneid, 143768, 181, 2, 2) --��������
GridStatusRaidDebuff:DebuffId(zoneid, 142803, 182, 6, 6) --��ɫ�߻���ը֮��
GridStatusRaidDebuff:DebuffId(zoneid, 143279, 183, 2, 2, true, true) --�������
GridStatusRaidDebuff:DebuffId(zoneid, 143339, 184, 6, 6, true, true) --ע��
GridStatusRaidDebuff:DebuffId(zoneid, 142649, 185, 4, 4) --����
GridStatusRaidDebuff:DebuffId(zoneid, 146556, 186, 6, 6) --����
GridStatusRaidDebuff:DebuffId(zoneid, 142671, 187, 6, 6) --������
GridStatusRaidDebuff:DebuffId(zoneid, 143979, 188, 2, 2, true, true) --����ͻϮ
GridStatusRaidDebuff:DebuffId(zoneid, 143974, 189, 2, 2) --�ܻ�(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 143570, 190, 6, 6, true, true) --�ȹ�ȼ��׼����3S��
GridStatusRaidDebuff:DebuffId(zoneid, 142547, 191, 6, 6) --���أ���ɫ
GridStatusRaidDebuff:DebuffId(zoneid, 143572, 192, 6, 6, true, true) --��ɫ�߻��ȹ�ȼ��
GridStatusRaidDebuff:DebuffId(zoneid, 142549, 193, 6, 6) --���أ���ɫ
GridStatusRaidDebuff:DebuffId(zoneid, 142550, 194, 6, 6) --���أ���ɫ
GridStatusRaidDebuff:DebuffId(zoneid, 148589, 195, 6, 6) -- ����ȱ��
GridStatusRaidDebuff:DebuffId(zoneid, 142945, 196, 5, 5, true, true) --��ɫ�߻�����֮��
GridStatusRaidDebuff:DebuffId(zoneid, 143358, 197, 5, 5) -- ����
GridStatusRaidDebuff:DebuffId(zoneid, 142315, 198, 5, 5, true, true) --����ѪҺ
--[[��˵����Ҫ
GridStatusRaidDebuff:DebuffId(zoneid, 143607, 199, 5, 5, true, true) --��ɫ����
GridStatusRaidDebuff:DebuffId(zoneid, 143614, 200, 5, 5, true, true) --��ɫս��
GridStatusRaidDebuff:DebuffId(zoneid, 143612, 201, 5, 5, true, true) --��ɫս��
GridStatusRaidDebuff:DebuffId(zoneid, 143609, 202, 5, 5, true, true) --��ɫ����
GridStatusRaidDebuff:DebuffId(zoneid, 143610, 203, 5, 5, true, true) --��ɫս��
GridStatusRaidDebuff:DebuffId(zoneid, 143617, 204, 5, 5, true, true) --��ɫը��
GridStatusRaidDebuff:DebuffId(zoneid, 143615, 205, 5, 5, true, true) --��ɫը��
GridStatusRaidDebuff:DebuffId(zoneid, 143619, 206, 5, 5, true, true) --��ɫը��
GridStatusRaidDebuff:DebuffId(zoneid, 142532, 207, 6, 6) --���أ���ɫ
GridStatusRaidDebuff:DebuffId(zoneid, 142534, 208, 6, 6) --���أ���ɫ
GridStatusRaidDebuff:DebuffId(zoneid, 142533, 209, 6, 6) --���أ���ɫ
]]

-- �Ӷ�³ʲ����������
GridStatusRaidDebuff:BossNameId(zoneid, 210, "Garrosh Hellscream")
GridStatusRaidDebuff:DebuffId(zoneid, 144582, 211, 4, 4, true, false) --�Ͻ�
GridStatusRaidDebuff:DebuffId(zoneid, 145183, 212, 2, 2, true, true) --����֮��(̹��)
GridStatusRaidDebuff:DebuffId(zoneid, 144762, 213, 4, 4) --����
GridStatusRaidDebuff:DebuffId(zoneid, 145071, 214, 5, 5) --��ɷ��֮��
GridStatusRaidDebuff:DebuffId(zoneid, 148718, 215, 4, 4) --���
GridStatusRaidDebuff:DebuffId(zoneid, 148983, 216, 4, 4) --��������̨
GridStatusRaidDebuff:DebuffId(zoneid, 147235, 217, 6, 6, true, true) -- �񶾳��
GridStatusRaidDebuff:DebuffId(zoneid, 148994, 218, 4, 4) -- ����������
GridStatusRaidDebuff:DebuffId(zoneid, 149004, 218, 4, 4) -- ϣ�������
GridStatusRaidDebuff:DebuffId(zoneid, 147324, 219, 5, 5) -- ����֮��
GridStatusRaidDebuff:DebuffId(zoneid, 145171, 220, 5, 5) -- ǿ����ɷ��֮����H��
GridStatusRaidDebuff:DebuffId(zoneid, 145175, 221, 5, 5) -- ǿ����ɷ��֮����N��
--GridStatusRaidDebuff:DebuffId(zoneid, 144954, 222, 4, 4) --��ɷ��֮����������Ϊ������ʾ
end

GridStatusRaidDebuff:Import(import)







































