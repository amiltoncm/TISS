unit uXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TfrmXML = class(TForm)
    TreeView1: TTreeView;
    btFechar: TBitBtn;
    XMLDocument1: TXMLDocument;
    procedure AdicionaNo(NoXML: IXMLNode; Pai : TTreeNode);
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXML: TfrmXML;

implementation

uses uVarGlobal;

{$R *.dfm}

procedure TfrmXML.AdicionaNo(NoXML: IXMLNode; Pai : TTreeNode);
var
SubNoXML : IXMLNode;
Filho : TTreeNode;
i : integer;
begin
  Filho := TreeView1.Items.AddChild(Pai, NoXML.NodeName);
  for i := 0 to NoXML.AttributeNodes.Count-1 do
    Filho.Text := Filho.Text + ' ' +
  NoXML.AttributeNodes.Get(i).NodeName + '=' + QuotedStr(NoXML.AttributeNodes.Get(i).Text);
  if NoXML.HasChildNodes then
  begin
    for i := 0 to NoXML.ChildNodes.Count - 1 do
    begin
      case NoXML.ChildNodes[i].NodeType of
        ntText : TreeView1.Items.AddChild(Filho, NoXML.Text);
      else
        SubNoXML := NoXML.ChildNodes[i];
      AdicionaNo(SubNoXML, Filho);
    end;
  end;
  end;
end;

procedure TfrmXML.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmXML.FormActivate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    XMLDocument1.LoadFromFile(vgOpenXML);
    XMLDocument1.Active := true;
    TreeView1.Items.Clear;
    AdicionaNo(XMLDocument1.DocumentElement, nil);
    Screen.Cursor := crDefault;
  except
    MessageDlg('Não foi possível carregar o arquivo!', mtWarning, [mbok], 0);
    Screen.Cursor := crDefault;
  end;
end;

end.
