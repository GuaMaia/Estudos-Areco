unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrame_Cadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls,System.JSON,REST.Types;

type
  TFCadProduto = class(TForm)
    FFrame_Cadastro1: TFFrame_Cadastro;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    edId: TEdit;
    edDescricao: TEdit;
    edUn: TEdit;
    edPreco: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FFrame_Cadastro1btSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FFrame_Cadastro1BtCancelarClick(Sender: TObject);
    procedure edPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edPrecoExit(Sender: TObject);
    procedure edUnKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    var_incluse : Boolean;
    procedure LimparCampos;
    procedure Manutencao;
  end;

var
  FCadProduto: TFCadProduto;

implementation

{$R *.dfm}

uses UGerProduto;

{ TFCadProduto }

procedure TFCadProduto.edPrecoExit(Sender: TObject);
begin
   edPreco.Text := FormatFloat('###,##0.00', StrtoCurr(edPreco.Text));
end;

procedure TFCadProduto.edPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9',','] = false)  then
    key := #0;
end;

procedure TFCadProduto.edUnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',','] = false)  then
    key := #0;
end;

procedure TFCadProduto.FFrame_Cadastro1BtCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente cancelar?', 'Aten��o', mb_YesNo + MB_ICONQUESTION ) = IdYes then
  begin
    close;
  end;
end;

procedure TFCadProduto.FFrame_Cadastro1btSalvarClick(Sender: TObject);
begin
   if Trim(edDescricao.Text) = '' then
   begin
     Application.MessageBox('Descri��o n�o pode ser vazio!','Aten��o',MB_ICONEXCLAMATION);
     edDescricao.SetFocus;
     Abort;
   end;

   if Trim(edUn.Text) = '' then
   begin
     Application.MessageBox('Unidade de medida n�o pode ser vazio!','Aten��o',MB_ICONEXCLAMATION);
     edUn.SetFocus;
     Abort;
   end;

   if Trim(edPreco.Text) = '' then
   begin
     Application.MessageBox('Pre�o unit�rio n�o pode ser vazio!','Aten��o',MB_ICONEXCLAMATION);
     edPreco.SetFocus;
     Abort;
   end;

   if StrToCurr(edPreco.Text) <= 0 then
   begin
     Application.MessageBox('Pre�o unit�rio deve ser maior que o valor zero!','Aten��o',MB_ICONEXCLAMATION);
     edPreco.SetFocus;
     Abort;
   end;

   Manutencao;
end;

procedure TFCadProduto.FormCreate(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFCadProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (ActiveControl is TMemo) then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFCadProduto.FormShow(Sender: TObject);
begin
  edDescricao.SetFocus;
end;

procedure TFCadProduto.LimparCampos;
begin
  edId.Clear;
  edDescricao.Clear;
  edUn.Clear;
  edPreco.Text := '0,00';
end;


procedure TFCadProduto.Manutencao;
var
  JsonBody : TJSONObject;
begin
   JsonBody := TJSONObject.Create;

   JsonBody.AddPair('descricao',edDescricao.Text);
   JsonBody.AddPair('unidade',edUn.Text);
   JsonBody.AddPair('preco',TJSONNumber.Create(StrToCurr(edPreco.Text)));

   FGerProduto.rqManu.Params.Clear;
   FGerProduto.rcCadastro.Authenticator := nil;

   FGerProduto.rqManu.Body.ClearBody;
   FGerProduto.rqManu.Body.Add(JsonBody.ToString, ContentTypeFromString('application/json'));

   if var_incluse = True  then
   begin
     FGerProduto.rcCadastro.BaseURL := 'http://localhost:8080/api/produtos';
     FGerProduto.rqManu.Method := rmPOST;
   end
   else
   begin
     FGerProduto.rcCadastro.BaseURL :=  'http://localhost:8080/api/produtos/' + edId.Text;
     FGerProduto.rqManu.Method := rmPUT;
   end;

   FGerProduto.rqManu.Execute;

   // trata o retorno
   if FGerProduto.rqManu.Response.StatusCode = 403  then
   begin
      ShowMessage('Api Forbidden');
      exit;
   end
   else Close;
end;

end.
