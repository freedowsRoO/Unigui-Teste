unit uControllerDividas;

interface

Uses FireDAC.Comp.Client, JSON, idHTTP, IdSSLOpenSSL , Data.DB, System.SysUtils;

type
  TControllerDividas = class
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    idHttp: TidHTTP;
    idSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    JSONRetorno: TJSONObject;
    sRetorno: String;
  public
    { Public declarations }
    function getAllDividas:  String;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TControllerDividas }

constructor TControllerDividas.Create;
begin
  inherited Create;
  idHttp:= TIdHTTP.Create(nil);
  idSSLIOHandlerSocketOpenSSL:= TIdSSLIOHandlerSocketOpenSSL.Create(nil);
end;

destructor TControllerDividas.Destroy;
begin
  freeandnil(idHttp);
  inherited;
end;

function TControllerDividas.getAllDividas: String;
begin
  // Init request:
  try
      try
        idHttp.Request.ContentType := 'application/json';
        idhttp.Request.Charset := 'UTF-8';
        IdHttp.IOHandler := idSSLIOHandlerSocketOpenSSL;

        idhttp.HandleRedirects := True;
        idhttp.ReadTimeout := 30000;
        idSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1;
        idSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := sslmUnassigned;

        // Set username and password:
    //    idHttp.Request.Clear;
    //    idHttp.Request.BasicAuthentication := False;
    //    idHttp.Request.Username := 'usuario';
    //    idHttp.Request.password := 'senha';

        idHttp.Response.ContentType := 'application/json';
        idHttp.Response.CharSet := 'UTF-8';

        //sRetorno:= idHttp.get('http://localhost:3333/bills');
        sRetorno:= idHttp.get('https://my.api.mockaroo.com/clientes.json?key=25fb65a0');

        //> Também tentei assim mas tb não funcionou
        //>Retorno := idHttp.Post(URL, JsonStreamEnvio);
      except

      end;

   finally
     Result:= sRetorno;
   end;
end;

procedure TControllerDividas.UniFormCreate(Sender: TObject);
begin

end;

end.
