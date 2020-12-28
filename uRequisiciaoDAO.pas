unit uRequisiciaoDAO;

interface

Uses FireDAC.Comp.Client, MainModule, System.SysUtils;

type TRequisiciaoDAO = class
  private
    qQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    function GetClientes() : TFDQuery;
end;

implementation

{ TRequisiciaoDAO }

constructor TRequisiciaoDAO.Create;
begin
  qQuery:= TFDQuery.Create(nil);
  qQuery.Connection:= UniMainModule.FDConnection1;
end;

destructor TRequisiciaoDAO.Destroy;
begin
  FreeAndNil(qQuery);
  inherited;
end;

function TRequisiciaoDAO.GetClientes: TFDQuery;
begin
  with qQuery do
  Begin
    close;
    sql.Clear;
    sql.Add('SELECT FIRST 500 * FROM MOCK_DATA');
    try
      open;
      FetchAll;
    except on e:exception do
    Begin
      raise Exception.Create(e.Message);
    End; 
      
    end;
  End;

  Result:= qQuery;
end;  
end.
