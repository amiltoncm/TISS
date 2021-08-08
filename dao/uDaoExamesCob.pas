unit uDaoExamesCob;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

  procedure FiltrarExamesCob(vfHisID: String);

implementation

uses dataDados;

procedure FiltrarExamesCob(vfHisID: String);
begin
  dmDados.qyExamesCob.Close;
  dmDados.qyExamesCob.SQL.Clear;
  dmDados.qyExamesCob.SQL.Add('select c.exa_id, r.res_nome, r.res_cpf, m.med_nome, m.med_cpf ');
  dmDados.qyExamesCob.SQL.Add('from examescob c, exames e, responsaveis r, medicos m ');
  dmDados.qyExamesCob.SQL.Add('where c.his_id = ' + vfHisID);
  dmDados.qyExamesCob.SQL.Add('and c.exa_id = e.exa_id and e.res_codigo = r.res_codigo ');
  dmDados.qyExamesCob.SQL.Add('and e.med_codigo = m.med_codigo order by c.exa_id');
  dmDados.qyExamesCob.Open;
end;

end.
