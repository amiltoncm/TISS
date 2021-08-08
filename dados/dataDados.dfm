inherited dmDados: TdmDados
  OldCreateOrder = True
  inherited database: TSDDatabase
    DatabaseName = 'genesis'
    SessionName = 'Sessao_1'
    Left = 32
  end
  inherited QGeraCodigo: TSDQuery
    SessionName = 'Sessao'
  end
  inherited QTemp: TSDQuery
    SessionName = 'Sessao'
  end
  object lkConvenios: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from convenios'
      'order by cov_descricao')
    Left = 416
    Top = 16
    object lkConvenioscov_descricao: TStringField
      DisplayLabel = 'Conv'#234'nio'
      DisplayWidth = 20
      FieldName = 'cov_descricao'
    end
    object lkConvenioscov_codigo: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'cov_codigo'
    end
    object lkConvenioscov_cnpj: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'cov_cnpj'
      Visible = False
      Size = 18
    end
    object lkConvenioscov_regans: TStringField
      DisplayLabel = 'Reg. ANS'
      DisplayWidth = 6
      FieldName = 'cov_regans'
      Visible = False
      Size = 6
    end
  end
  object qyReceber: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      
        'select r.rec_vencimento, r.rec_codigo, r.rec_nome, r.rec_valor, ' +
        'r.rec_emissao,'
      
        'r.cov_codigo, r.his_id, r.cob_codigo, r.rec_status, t.rec_codigo' +
        ', t.rti_gerado,'
      't.rti_id, t.rti_lote'
      'from receber r, rectiss t'
      'where r.rec_codigo = t.rec_codigo')
    Left = 256
    Top = 312
    object qyReceberrec_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 13
      FieldName = 'rec_vencimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyReceberrec_codigo: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 8
      FieldName = 'rec_codigo'
      DisplayFormat = '000000'
      EditFormat = '000000'
    end
    object qyReceberrec_nome: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'rec_nome'
      Size = 80
    end
    object qyReceberrec_valor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'rec_valor'
      DisplayFormat = '#,###,###,##0.00'
      EditFormat = '#,###,###,##0.00'
    end
    object qyReceberhis_id: TIntegerField
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 10
      FieldName = 'his_id'
      DisplayFormat = '000000'
    end
    object qyReceberrec_emissao: TDateField
      DisplayWidth = 10
      FieldName = 'rec_emissao'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyRecebercov_codigo: TIntegerField
      DisplayWidth = 10
      FieldName = 'cov_codigo'
      Visible = False
    end
    object qyRecebercob_codigo: TIntegerField
      DisplayWidth = 10
      FieldName = 'cob_codigo'
      Visible = False
    end
    object qyReceberrec_status: TStringField
      DisplayWidth = 1
      FieldName = 'rec_status'
      Visible = False
      Size = 1
    end
    object qyReceberrec_codigo_1: TIntegerField
      DisplayWidth = 10
      FieldName = 'rec_codigo_1'
      Visible = False
    end
    object qyReceberrti_gerado: TBooleanField
      DisplayWidth = 5
      FieldName = 'rti_gerado'
      Visible = False
    end
    object qyReceberrti_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'rti_id'
      Visible = False
    end
    object qyReceberrti_lote: TIntegerField
      DisplayWidth = 10
      FieldName = 'rti_lote'
      Visible = False
    end
  end
  object qyTiss: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    OnUpdateError = qyTissUpdateError
    BeforePost = qyTissBeforePost
    AfterPost = qyTissAfterPost
    OnPostError = qyTissPostError
    SQL.Strings = (
      'select * from tiss')
    UpdateObject = updTiss
    Left = 248
    Top = 392
    object qyTisstiss_cfg: TIntegerField
      FieldName = 'tiss_cfg'
    end
    object qyTisstiss_sequencial: TIntegerField
      FieldName = 'tiss_sequencial'
    end
    object qyTisstiss_versaopadrao: TStringField
      FieldName = 'tiss_versaopadrao'
      Size = 10
    end
    object qyTisstiss_lote: TIntegerField
      FieldName = 'tiss_lote'
    end
    object qyTisstab_id: TIntegerField
      FieldName = 'tab_id'
    end
  end
  object updTiss: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select tiss_cfg, tiss_sequencial, tiss_versaopadrao, tiss_lote, ' +
        'tab_id'
      'from tiss'
      'where'
      '  tiss_cfg = :OLD_tiss_cfg')
    ModifySQL.Strings = (
      'update tiss'
      'set'
      '  tiss_cfg = :tiss_cfg,'
      '  tiss_sequencial = :tiss_sequencial,'
      '  tiss_versaopadrao = :tiss_versaopadrao,'
      '  tiss_lote = :tiss_lote,'
      '  tab_id = :tab_id'
      'where'
      '  tiss_cfg = :OLD_tiss_cfg')
    InsertSQL.Strings = (
      'insert into tiss'
      
        '  (tiss_cfg, tiss_sequencial, tiss_versaopadrao, tiss_lote, tab_' +
        'id)'
      'values'
      
        '  (:tiss_cfg, :tiss_sequencial, :tiss_versaopadrao, :tiss_lote, ' +
        ':tab_id)')
    DeleteSQL.Strings = (
      'delete from tiss'
      'where'
      '  tiss_cfg = :OLD_tiss_cfg')
    Left = 304
    Top = 392
  end
  object qyEmpresa: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from empresa')
    Left = 504
    Top = 16
    object qyEmpresaemp_id: TIntegerField
      FieldName = 'emp_id'
    end
    object qyEmpresaemp_razao: TStringField
      FieldName = 'emp_razao'
      Size = 80
    end
    object qyEmpresaemp_cnpj: TStringField
      FieldName = 'emp_cnpj'
      Size = 18
    end
    object qyEmpresaemp_ie: TStringField
      FieldName = 'emp_ie'
      Size = 15
    end
    object qyEmpresaemp_inscmun: TStringField
      FieldName = 'emp_inscmun'
      Size = 15
    end
    object qyEmpresaemp_logradouro: TStringField
      FieldName = 'emp_logradouro'
      Size = 50
    end
    object qyEmpresaemp_bairro: TStringField
      FieldName = 'emp_bairro'
      Size = 30
    end
    object qyEmpresaemp_cidade: TStringField
      FieldName = 'emp_cidade'
      Size = 30
    end
    object qyEmpresaemp_uf: TStringField
      FieldName = 'emp_uf'
      Size = 2
    end
    object qyEmpresaemp_cep: TStringField
      FieldName = 'emp_cep'
      Size = 9
    end
    object qyEmpresaemp_telefone: TStringField
      FieldName = 'emp_telefone'
      Size = 15
    end
    object qyEmpresaemp_email: TStringField
      FieldName = 'emp_email'
      Size = 50
    end
    object qyEmpresaemp_homepage: TStringField
      FieldName = 'emp_homepage'
      Size = 50
    end
    object qyEmpresaemp_cnes: TStringField
      FieldName = 'emp_cnes'
      Size = 7
    end
  end
  object qyHistRec: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from histrec')
    Left = 256
    Top = 184
    object qyHistRechis_id: TIntegerField
      FieldName = 'his_id'
    end
    object qyHistRechis_item: TIntegerField
      FieldName = 'his_item'
    end
    object qyHistRechis_data: TDateField
      FieldName = 'his_data'
    end
    object qyHistRecexa_id: TStringField
      FieldName = 'exa_id'
      Size = 10
    end
    object qyHistReccov_codigo: TIntegerField
      FieldName = 'cov_codigo'
    end
    object qyHistRecpac_codigo: TIntegerField
      FieldName = 'pac_codigo'
    end
    object qyHistRechis_valor: TFloatField
      FieldName = 'his_valor'
    end
    object qyHistRechis_gercob: TStringField
      FieldName = 'his_gercob'
      Size = 1
    end
    object qyHistRecmed_codigo: TIntegerField
      FieldName = 'med_codigo'
    end
  end
  object qyConvenios: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from convenios')
    Left = 48
    Top = 104
    object qyConvenioscov_codigo: TIntegerField
      FieldName = 'cov_codigo'
    end
    object qyConvenioscov_descricao: TStringField
      FieldName = 'cov_descricao'
    end
    object qyConvenioscov_cnpj: TStringField
      FieldName = 'cov_cnpj'
      Size = 18
    end
    object qyConvenioscov_ie: TStringField
      FieldName = 'cov_ie'
      Size = 15
    end
    object qyConveniostpl_id: TIntegerField
      FieldName = 'tpl_id'
    end
    object qyConvenioscov_logradouro: TStringField
      FieldName = 'cov_logradouro'
      Size = 50
    end
    object qyConvenioscov_numero: TIntegerField
      FieldName = 'cov_numero'
    end
    object qyConvenioscov_bairro: TStringField
      FieldName = 'cov_bairro'
      Size = 30
    end
    object qyConvenioscid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object qyConvenioscov_fone: TStringField
      FieldName = 'cov_fone'
      Size = 14
    end
    object qyConvenioscov_celular: TStringField
      FieldName = 'cov_celular'
      Size = 14
    end
    object qyConvenioscov_fax: TStringField
      FieldName = 'cov_fax'
      Size = 14
    end
    object qyConvenioscov_email: TStringField
      FieldName = 'cov_email'
      Size = 40
    end
    object qyConvenioscov_cep: TStringField
      FieldName = 'cov_cep'
      Size = 9
    end
    object qyConvenioscov_regans: TStringField
      DisplayWidth = 6
      FieldName = 'cov_regans'
      Size = 6
    end
    object qyConvenioscov_veriftiss: TStringField
      FieldName = 'cov_veriftiss'
      Size = 1
    end
    object qyConvenioscov_codoperadora: TStringField
      DisplayLabel = 'C'#243'd. operadora'
      FieldName = 'cov_codoperadora'
      Size = 14
    end
  end
  object qyExames: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from exames')
    Left = 256
    Top = 112
    object qyExamesexa_id: TStringField
      FieldName = 'exa_id'
      Size = 10
    end
    object qyExamesexa_data: TDateField
      FieldName = 'exa_data'
    end
    object qyExamespac_codigo: TIntegerField
      FieldName = 'pac_codigo'
    end
    object qyExamesexa_paciente: TStringField
      FieldKind = fkLookup
      FieldName = 'exa_paciente'
      LookupDataSet = lkPacientes
      LookupKeyFields = 'pac_codigo'
      LookupResultField = 'pac_nome'
      KeyFields = 'pac_codigo'
      Size = 70
      Lookup = True
    end
    object qyExamespac_idade: TSmallintField
      FieldName = 'pac_idade'
    end
    object qyExamespac_meses: TStringField
      FieldName = 'pac_meses'
      Size = 30
    end
    object qyExamescov_codigo: TIntegerField
      FieldName = 'cov_codigo'
    end
    object qyExamesexa_matricula: TStringField
      FieldName = 'exa_matricula'
    end
    object qyExamesexa_guia: TStringField
      DisplayLabel = 'Guia'
      FieldName = 'exa_guia'
    end
    object qyExamesmed_codigo: TIntegerField
      FieldName = 'med_codigo'
    end
    object qyExamesexa_etapa: TIntegerField
      FieldName = 'exa_etapa'
    end
    object qyExamesexa_prioridade: TIntegerField
      FieldName = 'exa_prioridade'
    end
    object qyExamesexa_dataprior: TDateField
      FieldName = 'exa_dataprior'
    end
    object qyExamesexa_obs: TStringField
      FieldName = 'exa_obs'
      Size = 256
    end
    object qyExamesexa_origem: TIntegerField
      FieldName = 'exa_origem'
    end
    object qyExamesexa_destino: TIntegerField
      FieldName = 'exa_destino'
    end
    object qyExamesetp_id: TIntegerField
      FieldName = 'etp_id'
    end
    object qyExamesres_codigo: TIntegerField
      FieldName = 'res_codigo'
    end
  end
  object lkPacientes: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from pacientes')
    Left = 576
    Top = 16
    object lkPacientespac_codigo: TIntegerField
      FieldName = 'pac_codigo'
    end
    object lkPacientespac_nome: TStringField
      FieldName = 'pac_nome'
      Size = 80
    end
  end
  object qyMedicos: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from medicos')
    Left = 472
    Top = 192
    object qyMedicosmed_codigo: TIntegerField
      FieldName = 'med_codigo'
    end
    object qyMedicosmed_nome: TStringField
      FieldName = 'med_nome'
      Size = 50
    end
    object qyMedicosmed_fone: TStringField
      FieldName = 'med_fone'
      Size = 15
    end
    object qyMedicoscos_id: TIntegerField
      FieldName = 'cos_id'
      DisplayFormat = '00'
    end
    object qyMedicosmed_conselho: TStringField
      FieldKind = fkLookup
      FieldName = 'med_conselho'
      LookupDataSet = lkConselho
      LookupKeyFields = 'cos_codigo'
      LookupResultField = 'cos_tipo'
      KeyFields = 'cos_id'
      Size = 5
      Lookup = True
    end
    object qyMedicosmed_numconselho: TStringField
      FieldName = 'med_numconselho'
      Size = 10
    end
    object qyMedicosmed_titulo: TStringField
      FieldName = 'med_titulo'
      Size = 5
    end
    object qyMedicosmed_cpf: TStringField
      FieldName = 'med_cpf'
      Size = 18
    end
    object qyMedicoscos_uf: TStringField
      FieldName = 'cos_uf'
      Size = 2
    end
    object qyMedicosmed_logradouro: TStringField
      FieldName = 'med_logradouro'
      Size = 50
    end
    object qyMedicosmed_numero: TIntegerField
      FieldName = 'med_numero'
    end
    object qyMedicosmed_bairro: TStringField
      FieldName = 'med_bairro'
      Size = 30
    end
    object qyMedicoscid_codigo: TIntegerField
      FieldName = 'cid_codigo'
    end
    object qyMedicoscbo_codigo: TIntegerField
      FieldName = 'cbo_codigo'
    end
  end
  object lkConselho: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from conselhos')
    Left = 328
    Top = 16
    object lkConselhocos_codigo: TIntegerField
      FieldName = 'cos_codigo'
    end
    object lkConselhocos_tipo: TStringField
      FieldName = 'cos_tipo'
      Size = 5
    end
  end
  object qyExamesProced: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from examesproced')
    Left = 592
    Top = 112
    object qyExamesProcedexp_id: TIntegerField
      FieldName = 'exp_id'
    end
    object qyExamesProcedexa_id: TStringField
      FieldName = 'exa_id'
      Size = 10
    end
    object qyExamesProcedprc_tuss: TIntegerField
      FieldName = 'prc_tuss'
    end
    object qyExamesProcedprc_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'prc_descricao'
      LookupDataSet = lkProcedimentos
      LookupKeyFields = 'prc_tuss'
      LookupResultField = 'prc_descricao'
      KeyFields = 'prc_tuss'
      Size = 60
      Lookup = True
    end
    object qyExamesProcedexp_quant: TIntegerField
      FieldName = 'exp_quant'
    end
    object qyExamesProcedexp_unitario: TFloatField
      FieldName = 'exp_unitario'
    end
    object qyExamesProcedexp_total: TFloatField
      FieldName = 'exp_total'
    end
  end
  object lkProcedimentos: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from procedimentos')
    Left = 664
    Top = 16
    object lkProcedimentosprc_tuss: TIntegerField
      FieldName = 'prc_tuss'
    end
    object lkProcedimentosprc_descricao: TStringField
      FieldName = 'prc_descricao'
      Size = 80
    end
    object lkProcedimentosprc_amr: TIntegerField
      FieldName = 'prc_amr'
    end
    object lkProcedimentosprc_descant: TStringField
      FieldName = 'prc_descant'
      Size = 80
    end
    object lkProcedimentosprc_vlrhora: TFloatField
      FieldName = 'prc_vlrhora'
    end
    object lkProcedimentosprc_vlroper: TFloatField
      FieldName = 'prc_vlroper'
    end
    object lkProcedimentosprc_vlrfilme: TFloatField
      FieldName = 'prc_vlrfilme'
    end
    object lkProcedimentosprc_vlrtotal: TFloatField
      FieldName = 'prc_vlrtotal'
    end
  end
  object qyRecTiss: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    OnUpdateError = qyRecTissUpdateError
    BeforePost = qyRecTissBeforePost
    AfterPost = qyRecTissAfterPost
    OnPostError = qyRecTissPostError
    SQL.Strings = (
      'select * from rectiss')
    UpdateObject = updRecTiss
    Left = 472
    Top = 304
    object qyRecTissrti_id: TIntegerField
      FieldName = 'rti_id'
    end
    object qyRecTissrec_codigo: TIntegerField
      FieldName = 'rec_codigo'
    end
    object qyRecTissrti_gerado: TBooleanField
      FieldName = 'rti_gerado'
    end
    object qyRecTissrti_nguias: TIntegerField
      FieldName = 'rti_nguias'
    end
    object qyRecTissrti_lote: TIntegerField
      FieldName = 'rti_lote'
    end
  end
  object updRecTiss: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select rti_id, rec_codigo, rti_gerado, rti_lote, rti_nguias'
      'from rectiss'
      'where'
      '  rti_id = :OLD_rti_id')
    ModifySQL.Strings = (
      'update rectiss'
      'set'
      '  rti_id = :rti_id,'
      '  rec_codigo = :rec_codigo,'
      '  rti_gerado = :rti_gerado,'
      '  rti_lote = :rti_lote,'
      '  rti_nguias = :rti_nguias'
      'where'
      '  rti_id = :OLD_rti_id')
    InsertSQL.Strings = (
      'insert into rectiss'
      '  (rti_id, rec_codigo, rti_gerado, rti_lote, rti_nguias)'
      'values'
      '  (:rti_id, :rec_codigo, :rti_gerado, :rti_lote, :rti_nguias)')
    DeleteSQL.Strings = (
      'delete from rectiss'
      'where'
      '  rti_id = :OLD_rti_id')
    Left = 552
    Top = 304
  end
  object qyEmails: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    OnUpdateError = qyEmailsUpdateError
    BeforePost = qyEmailsBeforePost
    AfterPost = qyEmailsAfterPost
    OnPostError = qyEmailsPostError
    SQL.Strings = (
      'select * from emails')
    UpdateObject = updEmails
    Left = 48
    Top = 184
    object qyEmailsema_endereco: TStringField
      DisplayLabel = 'endere'#231'o'
      FieldName = 'ema_endereco'
      Size = 50
    end
    object qyEmailsema_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ema_id'
    end
  end
  object updEmails: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select ema_id, ema_endereco'#13#10'from emails'
      'where'
      '  ema_id = :OLD_ema_id')
    ModifySQL.Strings = (
      'update emails'
      'set'
      '  ema_id = :ema_id,'
      '  ema_endereco = :ema_endereco'
      'where'
      '  ema_id = :OLD_ema_id')
    InsertSQL.Strings = (
      'insert into emails'
      '  (ema_id, ema_endereco)'
      'values'
      '  (:ema_id, :ema_endereco)')
    DeleteSQL.Strings = (
      'delete from emails'
      'where'
      '  ema_id = :OLD_ema_id')
    Left = 120
    Top = 184
  end
  object Sessao: TSDSession
    Active = True
    SessionName = 'Sessao'
    Left = 96
    Top = 16
  end
  object qyModulos: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    OnUpdateError = qyModulosUpdateError
    AfterInsert = qyModulosAfterInsert
    BeforePost = qyModulosBeforePost
    AfterPost = qyModulosAfterPost
    BeforeDelete = qyModulosBeforeDelete
    AfterDelete = qyModulosAfterDelete
    OnPostError = qyModulosPostError
    SQL.Strings = (
      'select mod_codigo, mod_executavel, mod_nome, mod_descricao, '
      'mod_versaoinst from modulos'
      'order by mod_codigo')
    UpdateObject = updModulos
    Left = 48
    Top = 304
    object qyModulosmod_codigo: TIntegerField
      FieldName = 'mod_codigo'
    end
    object qyModulosmod_executavel: TStringField
      FieldName = 'mod_executavel'
      Size = 15
    end
    object qyModulosmod_nome: TStringField
      FieldName = 'mod_nome'
      Size = 15
    end
    object qyModulosmod_descricao: TStringField
      FieldName = 'mod_descricao'
      Size = 50
    end
    object qyModulosmod_versaoinst: TStringField
      FieldName = 'mod_versaoinst'
      Size = 10
    end
  end
  object updModulos: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select mod_codigo, mod_executavel, mod_nome, mod_descricao, mod_' +
        'versaoinst'#13#10'from modulos'
      'where'
      '  mod_codigo = :OLD_mod_codigo')
    ModifySQL.Strings = (
      'update modulos'
      'set'
      '  mod_codigo = :mod_codigo,'
      '  mod_executavel = :mod_executavel,'
      '  mod_nome = :mod_nome,'
      '  mod_descricao = :mod_descricao,'
      '  mod_versaoinst = :mod_versaoinst'
      'where'
      '  mod_codigo = :OLD_mod_codigo')
    InsertSQL.Strings = (
      'insert into modulos'
      
        '  (mod_codigo, mod_executavel, mod_nome, mod_descricao, mod_vers' +
        'aoinst)'
      'values'
      
        '  (:mod_codigo, :mod_executavel, :mod_nome, :mod_descricao, :mod' +
        '_versaoinst)')
    DeleteSQL.Strings = (
      'delete from modulos'
      'where'
      '  mod_codigo = :OLD_mod_codigo')
    Left = 120
    Top = 304
  end
  object qyUf: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select uf_sigla, uf_estado, uf_codigo from uf')
    Left = 472
    Top = 384
    object qyUfuf_sigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'uf_sigla'
      FixedChar = True
      Size = 2
    end
    object qyUfuf_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'uf_estado'
      Size = 25
    end
    object qyUfuf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'uf_codigo'
    end
  end
  object qyResposnsaveis: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from responsaveis')
    Left = 48
    Top = 392
    object qyResposnsaveisres_codigo: TIntegerField
      FieldName = 'res_codigo'
    end
    object qyResposnsaveisres_nome: TStringField
      FieldName = 'res_nome'
      Size = 80
    end
    object qyResposnsaveisres_titulo: TStringField
      FieldName = 'res_titulo'
      Size = 5
    end
    object qyResposnsaveiscos_id: TIntegerField
      FieldName = 'cos_id'
      DisplayFormat = '00'
    end
    object qyResposnsaveisres_numconselho: TStringField
      FieldName = 'res_numconselho'
      Size = 10
    end
    object qyResposnsaveiscos_uf: TStringField
      FieldName = 'cos_uf'
      FixedChar = True
      Size = 2
    end
    object qyResposnsaveisres_iniciais: TStringField
      FieldName = 'res_iniciais'
      Size = 10
    end
    object qyResposnsaveiscbo_codigo: TIntegerField
      FieldName = 'cbo_codigo'
    end
    object qyResposnsaveisprt_codigo: TIntegerField
      FieldName = 'prt_codigo'
      DisplayFormat = '00'
    end
    object qyResposnsaveisres_cpf: TStringField
      FieldName = 'res_cpf'
      Size = 15
    end
  end
  object qyExamesAut: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from examesaut')
    Left = 360
    Top = 112
    object qyExamesAutexa_id: TStringField
      FieldName = 'exa_id'
      FixedChar = True
      Size = 10
    end
    object qyExamesAutaut_senha: TStringField
      FieldName = 'aut_senha'
    end
    object qyExamesAutaut_data: TDateField
      FieldName = 'aut_data'
    end
  end
  object qyExamesTISS: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from examestiss')
    Left = 360
    Top = 184
    object qyExamesTISSexa_id: TStringField
      FieldName = 'exa_id'
      FixedChar = True
      Size = 10
    end
    object qyExamesTISStis_tipoatend: TIntegerField
      FieldName = 'tis_tipoatend'
    end
  end
  object qyExamesCob: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao'
    SQL.Strings = (
      'select c.exa_id, r.res_nome, r.res_cpf, m.med_nome, m.med_cpf'
      'from examescob c, exames e, responsaveis r, medicos m'
      'where c.his_id = -1'
      'and c.exa_id = e.exa_id'
      'and e.res_codigo = r.res_codigo'
      'and e.med_codigo = m.med_codigo'
      ''
      'and c.his_id = 0')
    Left = 464
    Top = 112
    object qyExamesCobexa_id: TStringField
      DisplayLabel = 'ID Exame'
      FieldName = 'exa_id'
      FixedChar = True
      Size = 10
    end
    object qyExamesCobres_nome: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'res_nome'
      Size = 80
    end
    object qyExamesCobres_cpf: TStringField
      DisplayLabel = 'CPF Resp.'
      FieldName = 'res_cpf'
      Size = 15
    end
    object qyExamesCobmed_nome: TStringField
      DisplayLabel = 'M'#233'dico'
      FieldName = 'med_nome'
      Size = 50
    end
    object qyExamesCobmed_cpf: TStringField
      DisplayLabel = 'CPF. M'#233'd.'
      FieldName = 'med_cpf'
      Size = 18
    end
  end
end
