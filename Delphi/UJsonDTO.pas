unit UJsonDTO;

interface

uses
   System.JSON, System.SysUtils, System.Classes, REST.Response.Adapter, REST.Client;


type

  TJsonDTO = class
  private
    FID: Integer;
    FDescricao: string;
    FUnidade: string;
    FPreco: Double;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Unidade: string read FUnidade write FUnidade;
    property Preco: Double read FPreco write FPreco;
  end;

  TJSONReader = class
  public
    class function BuscaTodosProdutos(AResponse: TRESTResponse): TArray<TJsonDTO>;
    class function BuscaProduto(AResponse: TRESTResponse): TJsonDTO;
  end;

implementation

class function TJSONReader.BuscaProduto(AResponse: TRESTResponse): TJsonDTO;
var
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
begin
  JSONValue := TJSONObject.ParseJSONValue(AResponse.Content);

  try
    if Assigned(JSONValue) and (JSONValue is TJSONObject) then
    begin
      JSONObject := TJSONObject(JSONValue);
      Result := TJsonDTO.Create;
      try
        Result.ID := JSONObject.GetValue<Integer>('id');
        Result.Descricao := JSONObject.GetValue<string>('descricao');
        Result.Unidade := JSONObject.GetValue<string>('unidade');
        Result.Preco := JSONObject.GetValue<Double>('preco');
      except
        Result.Free;
        raise;
      end;
    end
    else
      Result := nil;
  finally
    JSONValue.Free;
  end;
end;

class function TJSONReader.BuscaTodosProdutos(AResponse: TRESTResponse): TArray<TJsonDTO>;
var
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  JSONItem: TJSONValue;
  Produto: TJsonDTO;
  I: Integer;
begin
  JSONValue := TJSONObject.ParseJSONValue(AResponse.Content);

  try
    if Assigned(JSONValue) and (JSONValue is TJSONArray) then
    begin
      JSONArray := TJSONArray(JSONValue);
      SetLength(Result, JSONArray.Count);

      for I := 0 to JSONArray.Count - 1 do
      begin
        JSONItem := JSONArray.Items[I];
        Produto := TJsonDTO.Create;
        Produto.ID := JSONItem.GetValue<Integer>('id');
        Produto.Descricao := JSONItem.GetValue<string>('descricao');
        Produto.Unidade := JSONItem.GetValue<string>('unidade');
        Produto.Preco := JSONItem.GetValue<Double>('preco');
        Result[I] := Produto;
      end;
    end
    else
      SetLength(Result, 0);
  finally
    JSONValue.Free;
  end;
end;

end.
