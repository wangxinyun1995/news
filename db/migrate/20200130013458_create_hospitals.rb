class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.boolean :sExtremeEmergency, comment: '是否非常非常紧急'
      t.string :name, comment: "医院名称"
      t.string :province, comment: '所在省份'
      t.string :city, comment: '所在城市'
      t.string :suburb, comment: '所在地区'
      t.string :address, comment: '详细地址'
      t.string :contactName, comment: '联系人'
      t.string :contactPhone, comment: '联系电话'
      t.string :official, comment: '是否官方信息（官网/官微）'
      t.string :trueness, comment: '是否核实真实性（电话-微信视频-带相片工作证-医院官方电话核验联系人信息'
      t.string :supplies, comment: '急需物资'
      t.string :drugs, comment: '急需药品'
      t.string :suppliesN95, comment: 'N95口罩（个）'
      t.string :suppliesMSM, comment: '医用外科口罩（个）'
      t.string :suppliesA, comment: '一次性医用口罩（个）'
      t.string :suppliesB, comment: '护目镜（个）'
      t.string :suppliesC, comment: '防冲击眼罩（个）'
      t.string :suppliesD, comment: '防水面罩（一次性）（个）'
      t.string :suppliesE, comment: ' 防护服（套）'
      t.string :suppliesF, comment: '手术衣（件）'
      t.string :suppliesG, comment: '隔离衣（件）'
      t.string :suppliesH, comment: '医用帽（个）'
      t.string :suppliesI, comment: '防水、防污染鞋（长筒）（套）'
      t.string :suppliesJ, comment: '乳胶手套（双）'
      t.string :suppliesK, comment: '免洗手消毒液'
      t.string :suppliesL, comment: '红外线体温仪'
      t.string :suppliesM, comment: '酒精'
      t.string :suppliesN, comment: '84消毒液'
      t.datetime :suppliesO, comment: '提出日期（到武汉中转站的日期）'
      t.string :suppliesP, comment: '物流编码/线下配送（填线上邮寄编码或写线下配送）'
      t.string :suppliesR, comment: '物流状态（邮寄写到达城市/配送写配送状态：未配送/配送中/已配送）'
      t.string :suppliesS, comment: '送货人'
      t.string :suppliesT, comment: '交付日期（医院收货日期）'
      t.string :suppliesU, comment: '签收人'
      t.string :suppliesV, comment: '备注（不在前面表头的信息，例如病患情况，是否接受社会捐赠）'
      t.string :suppliesW, comment: '备注物资'

      t.timestamps
    end
  end
end
