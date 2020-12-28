unit uControllerAPI;

interface

Uses FireDAC.Comp.Client, JSON, uRequisicao, Data.DB, System.SysUtils;

type
  TControllerAPI = class
  private
    { Private declarations }
    sRetorno: String;
  public
    { Public declarations }
    function GetLink:  String;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TControllerDividas }

constructor TControllerAPI.Create;
Begin
end;

destructor TControllerAPI.Destroy;
begin
  inherited;
end;

function TControllerAPI.GetLink: String;
var
  requisicao: TRequisicao;
begin
  requisicao:= TRequisicao.create;
  Result:= requisicao.GET('comments','');
  FreeAndNil(requisicao);
end;

end.
