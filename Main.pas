unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, uniMemo, JSON,
  Data.DB, REST.Response.Adapter, uniButton, uniPanel;

type
  TMainForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    UniMemo1: TUniMemo;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniPanel1: TUniPanel;
    UniButton4: TUniButton;
    UniButton5: TUniButton;
    UniButton6: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uControllerDividas, uControllerAPI
  ,uRequisiciaoDAO;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.JsonToDataset(aDataset : TDataSet; aJSON : string);
var
  JObj: TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  requisicaoCliente : TRequisiciaoDAO;
begin
  requisicaoCliente:= TRequisiciaoDAO.Create;
  FDMemTable1.Data:= requisicaoCliente.GetClientes.Data;
  DataSource1.DataSet:= FDMemTable1;
  FreeAndNil(requisicaoCliente);
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  UniMainModule.FDQuery1.Open();
  DataSource1.DataSet:= UniMainModule.FDQuery1;
end;

procedure TMainForm.UniButton4Click(Sender: TObject);
begin
 UniMainModule.FDQuery1.Close;
end;

procedure TMainForm.UniButton5Click(Sender: TObject);
begin
FDMemTable1.Close;
end;

procedure TMainForm.UniButton6Click(Sender: TObject);
Var
  API: TControllerAPI;
  i: Integer;
begin
  JsonToDataset(FDMemTable1, API.GetLink);

  for I := 0 to FDMemTable1.FieldCount-1 do
  Begin
      UniDBGrid1.Columns.Add.FieldName := FDMemTable1.Fields[i].FieldName;
      UniDBGrid1.Columns[i].flex:= 1;
      UniDBGrid1.ForceFit:= True;
  End;

  DataSource1.DataSet:= FDMemTable1;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
