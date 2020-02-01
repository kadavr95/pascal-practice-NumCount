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



procedure TForm2.OpenClick(Sender: TObject);//����� ��������� �����
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
 if sdl.execute then// ����� ����� ��� ����������
   begin
    for i := 0 to 9 do//���������� ������� ������� ����� ������
     m[i]:=0;
    assignfile(ff,sdl.FileName);
    reset(f);
    while s<>'.' do//���������� ���� ��� ������ �� �����
     begin
      readln(f,s);
       if pos(s,'0123456789')>0 then //���� �����, �� � ������� ��� ������������� +1
        m[pos(s,'0123456789')-1]:=m[pos(s,'0123456789')-1]+1;
     end;
    closefile(f);
    rewrite(ff);
    for i := 0 to 9 do //����� ������������� � �������������� ����
     begin
      writeln(ff,i,' was used ',m[i],' times');
     end;
    closefile(ff);
   end;
end;

procedure TForm2.tme2Timer(Sender: TObject);//��������� �����
begin
 form2.Show;
 tme2.Enabled:=false;
end;

procedure TForm2.tmeTimer(Sender: TObject);//������� �����, ��������� ������
begin
  form3.Show;
  form2.Hide;
  tme.Enabled:=false;
end;

end.
