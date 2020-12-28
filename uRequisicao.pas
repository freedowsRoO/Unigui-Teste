unit uRequisicao;

interface

Uses
  REST.Response.Adapter, System.JSON, uniMemo, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.SysUtils;

type
  TRequisicao = class
  private
    { Private declarations }
    RESTClient   : TRESTClient;
    RESTRequest  : TRESTRequest;
    RESTResponse : TRESTResponse;
    JSONRetorno  : TJSONObject;
    sRetorno     : String;
  public
    { Public declarations }
    function GET(url, params: String): String;
    function POST(url, params: String): String;
    function PUT(url, params: String): String;
    function DELETE(url, params: String): String;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRequisicao }

constructor TRequisicao.Create;
begin
  RESTResponse:= TRESTResponse.Create(nil);
  RESTClient  := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);

  RESTClient.Accept:='application/json, text/plain; q=0.9, text/html;q=0.8';
  RESTClient.AcceptCharset:='utf-8, *;q=0.8';
  RESTClient.BaseURL:= 'https://jsonplaceholder.typicode.com/'; //'https://my.api.mockaroo.com';
  RESTClient.HandleRedirects:= True;
  RESTClient.AllowCookies:= True;
  RESTClient.AutoCreateParams:= True;
  RESTClient.SynchronizedEvents:= True;

  RESTRequest.Accept:='application/json, text/plain; q=0.9, text/html;q=0.8';
  RESTRequest.AcceptCharset:='utf-8, *;q=0.8';
  RESTRequest.AutoCreateParams:= True;
  RESTRequest.Client:= RESTClient;
  RESTRequest.HandleRedirects:= True;
  RESTRequest.Response:= RESTResponse;
  RESTRequest.SynchronizedEvents:= True;
  RESTRequest.Timeout:= 15000;
end;

destructor TRequisicao.Destroy;
begin
  freeAndNil(RESTRequest);
  freeAndNil(RESTClient);
  freeAndNil(RESTResponse);
  inherited;
end;

function TRequisicao.DELETE(url, params: String): String;
begin
  Result:= '';
end;

function TRequisicao.GET(url, params: String): String;
begin
  RESTRequest.Method:= rmGET;
  RESTRequest.Resource:= URL;
  RESTRequest.Execute;
  //RESTRequest.Params.AddUrlSegment('ID','CAMPO DE PARAMETRO');
  Result:= RESTResponse.Content;
end;

function TRequisicao.POST(url, params: String): String;
begin
  Result:= '';
end;

function TRequisicao.PUT(url, params: String): String;
begin
   Result:= '';
end;

end.
