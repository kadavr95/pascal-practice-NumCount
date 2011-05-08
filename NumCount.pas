unit NumCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    tme: TTimer;
    tme2: TTimer;
    odl: TOpenDialog;
    sdl: TSaveDialog;
    Open: TButton;
    Save: TButton;
    procedure tmeTimer(Sender: TObject);
    procedure tme2Timer(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  f,ff:textfile;
implementation
uses DIMINI;
{$R *.dfm}



procedure TForm2.OpenClick(Sender: TObject);//Выбор исходного файла
begin
if odl.execute then
  assignfile(f,odl.FileName);
end;

procedure TForm2.SaveClick(Sender: TObject);
var
i:integer;
s:string;
m:array[0..9] of integer;
begin
 if sdl.execute then// Выбор файла для сохранения
   begin
    for i := 0 to 9 do//Заполнение массива наличия чисел нулями
     m[i]:=0;
    assignfile(ff,sdl.FileName);
    reset(f);
    while s<>'.' do//Выполнение пока нет строки из точки
     begin
      readln(f,s);
       if pos(s,'0123456789')>0 then //Если число, то в массиве его встречаемость +1
        m[pos(s,'0123456789')-1]:=m[pos(s,'0123456789')-1]+1;
     end;
    closefile(f);
    rewrite(ff);
    for i := 0 to 9 do //Вывод встречаемости в результирующий файл
     begin
      writeln(ff,i,' was used ',m[i],' times');
     end;
    closefile(ff);
   end;
end;

procedure TForm2.tme2Timer(Sender: TObject);//Появление формы
begin
 form2.Show;
 tme2.Enabled:=false;
end;

procedure TForm2.tmeTimer(Sender: TObject);//Скрытие формы, появление Димини
begin
  form3.Show;
  form2.Hide;
  tme.Enabled:=false;
end;

end.
