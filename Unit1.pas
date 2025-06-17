unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

// -------------- Variable globale 'solde' utilisé pour ce programme ---------------------------------------
  var solde : integer = 0;
  var frais : integer;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    depot1: TMenuItem;
    retrait1: TMenuItem;
    transfert1: TMenuItem;
    depot2: TMenuItem;
    retrait2: TMenuItem;
    transfert2: TMenuItem;
    memoAccueil: TMemo;
    memoDepot: TMemo;
    edtLabelDeposer: TEdit;
    edtMontantDeposer: TEdit;
    btnValideDepot: TButton;
    Quitter1: TMenuItem;
    memoRetrait: TMemo;
    edtLabelRetrait: TEdit;
    edtMontantRetrait: TEdit;
    btnValideRetrait: TButton;
    memoTransfert: TMemo;
    edtLabelTransfert: TEdit;
    edtMontantTransfert: TEdit;
    btnValideTransfert: TButton;
    edtMessage: TEdit;
    memoSolde: TMemo;
    edtLabelPhone: TEdit;
    edtPhone: TEdit;
    procedure depot2Click(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure retrait2Click(Sender: TObject);
    procedure depot1Click(Sender: TObject);
    procedure transfert2Click(Sender: TObject);
    procedure btnValideDepotClick(Sender: TObject);
    procedure btnValideRetraitClick(Sender: TObject);
    procedure btnValideTransfertClick(Sender: TObject);
    procedure transfert1Click(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ---- Fonction à implementer ---------------------------------------------------------------------------------
  //function frais
procedure calcul_frais(somme: integer);
begin
    if (somme>=500) AND (somme<=5000) then
        frais:=300
    else if (somme>=5001) AND (somme<=10000) then
        frais:=500
    else if (somme>=10001) AND (somme<=15000) then
        frais:=1000
    else if (somme>=15001) AND (somme<=20000) then
        frais:=1500
    else if (somme>20000) then
        frais:=2000
end;

  //function depot
function depot(valeurAjouter : integer) : boolean;
begin
    if (valeurAjouter>=0) then
    begin
        calcul_frais(valeurAjouter);
        solde:=solde+valeurAjouter+frais;
        frais:=0;
        depot:=True;
    end
    else
    begin
        depot:=False;
    end;
end;

  //function retrait
function retrait(valeurRetirer : integer) : boolean;
var frais : integer;
begin
    if (valeurRetirer<=solde) then
    begin
        frais:=0;
       calcul_frais(valeurRetirer);
        solde:=solde-(valeurRetirer+frais);
        retrait:=True;
    end
    else
    begin
        retrait:=False;
    end;
end;

  //function transfert
function transfert(valeurTransferer : integer) : boolean;
var frais : integer;
begin
    if (valeurTransferer<=solde) then
    begin
        frais:=0;
        calcul_frais(valeurTransferer);
        solde:=solde-(valeurTransferer+frais);
        transfert:=True;
    end
    else
    begin
        transfert:=False;
    end;
end;

procedure TForm1.depot2Click(Sender: TObject);
begin
    memoAccueil.Visible:=False;
    memoDepot.Visible:=True;
    memoRetrait.Visible:=False;
    edtLabelDeposer.Visible:=True;
    edtMontantDeposer.Visible:=True;
    btnValideDepot.Visible:=True;
    edtLabelRetrait.Visible:=False;
    edtMontantRetrait.Visible:=False;
    btnValideRetrait.Visible:=False;
    memoTransfert.Visible:=False;
    edtLabelTransfert.Visible:=False;
    edtMontantTransfert.Visible:=False;
    btnValideTransfert.Visible:=False;
    edtMessage.Visible:=False;
    memoSolde.Visible:=False;
    edtMontantDeposer.Text:='';
    edtPhone.Visible:=False;
    edtLabelPhone.Visible:=False;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
    application.Terminate;
end;

procedure TForm1.retrait2Click(Sender: TObject);
begin
    memoAccueil.Visible:=False;
    memoDepot.Visible:=False;
    memoRetrait.Visible:=True;
    edtLabelDeposer.Visible:=False;
    edtMontantDeposer.Visible:=False;
    btnValideDepot.Visible:=False;
    edtLabelRetrait.Visible:=True;
    edtMontantRetrait.Visible:=True;
    btnValideRetrait.Visible:=True;
    memoTransfert.Visible:=False;
    edtLabelTransfert.Visible:=False;
    edtMontantTransfert.Visible:=False;
    btnValideTransfert.Visible:=False;
    edtMessage.Visible:=False;
    memoSolde.Visible:=False;
    edtMontantRetrait.Text:='';
    edtPhone.Visible:=False;
    edtLabelPhone.Visible:=False;
end;

procedure TForm1.depot1Click(Sender: TObject);
begin
    memoAccueil.Visible:=True;
    memoDepot.Visible:=False;
    memoRetrait.Visible:=False;
    edtLabelDeposer.Visible:=False;
    edtMontantDeposer.Visible:=False;
    btnValideDepot.Visible:=False;
    edtLabelRetrait.Visible:=False;
    edtMontantRetrait.Visible:=False;
    btnValideRetrait.Visible:=False;
    memoTransfert.Visible:=False;
    edtLabelTransfert.Visible:=False;
    edtMontantTransfert.Visible:=False;
    btnValideTransfert.Visible:=False;
    edtMessage.Visible:=False;
    memoSolde.Visible:=False;
    edtPhone.Visible:=False;
    edtLabelPhone.Visible:=False;
end;

procedure TForm1.transfert2Click(Sender: TObject);
begin
    memoAccueil.Visible:=False;
    memoDepot.Visible:=False;
    memoRetrait.Visible:=False;
    edtLabelDeposer.Visible:=False;
    edtMontantDeposer.Visible:=False;
    btnValideDepot.Visible:=False;
    edtLabelRetrait.Visible:=False;
    edtMontantRetrait.Visible:=False;
    btnValideRetrait.Visible:=False;
    memoTransfert.Visible:=True;
    edtLabelTransfert.Visible:=True;
    edtMontantTransfert.Visible:=True;
    btnValideTransfert.Visible:=True;
    edtMessage.Visible:=False;
    memoSolde.Visible:=False;
    edtMontantTransfert.Text:='';
    edtPhone.Visible:=True;
    edtLabelPhone.Visible:=True;
end;

procedure TForm1.btnValideDepotClick(Sender: TObject);
var montant : integer;
var verificationDepot : boolean;
begin
    montant := strToInt(edtMontantDeposer.Text);
    if(montant>=500) then
    begin
        verificationDepot := depot(montant);
        if (verificationDepot=True) then
        begin
            edtMessage.Visible:=True;
            edtMessage.Text:='depot reussi!!!!, Votre solde maintenant est :'+intToStr(solde);
        end;
    end
    else
    begin
        edtMessage.Visible:=True;
        edtMessage.Text:='Désolé, le montant que vous avez entrez est incorrect';
    end;
end;

procedure TForm1.btnValideRetraitClick(Sender: TObject);
var montant : integer;
var verificationRetrait : boolean;
begin
    montant := strToInt(edtMontantDeposer.Text);
    if(montant>=500) then
    begin
        verificationRetrait := retrait(montant);
        if (verificationRetrait=True) then
        begin
            edtMessage.Visible:=True;
            edtMessage.Text:='retrait reussi!!!!, Votre solde maintenant est :'+intToStr(solde);
        end
        else
        begin
            edtMessage.Visible:=True;
            edtMessage.Text:='Désolé, le solde est insuffisant';
        end;
    end
    else
    begin
        edtMessage.Visible:=True;
        edtMessage.Text:='Désolé, le montant que vous avez entrez est incorrect';
    end;
end;

procedure TForm1.btnValideTransfertClick(Sender: TObject);
var montant : integer;
var verificationTransfert : boolean;
begin
    if (edtPhone.Text <>'') then
    begin
        montant := strToInt(edtMontantDeposer.Text);
        if(montant>=500) then
        begin
            verificationTransfert := retrait(montant);
            if (verificationTransfert=True) then
            begin
                edtMessage.Visible:=True;
                edtMessage.Text:='transfert reussi!!!!, Votre solde maintenant est :'+intToStr(solde);
            end
            else
            begin
                edtMessage.Visible:=True;
                edtMessage.Text:='Désolé, le solde est insuffisant';
            end;
        end
        else
        begin
            edtMessage.Visible:=True;
            edtMessage.Text:='Désolé, le montant que vous avez entrez est incorrect';
        end;
  end
  else
  begin
      edtMessage.Visible:=True;
      edtMessage.Text:='veuillez saisir le numéro de telephone';
  end;
end;

procedure TForm1.transfert1Click(Sender: TObject);
begin
    memoAccueil.Visible:=False;
    memoDepot.Visible:=False;
    memoRetrait.Visible:=False;
    edtLabelDeposer.Visible:=False;
    edtMontantDeposer.Visible:=False;
    btnValideDepot.Visible:=False;
    edtLabelRetrait.Visible:=False;
    edtMontantRetrait.Visible:=False;
    btnValideRetrait.Visible:=False;
    memoTransfert.Visible:=False;
    edtLabelTransfert.Visible:=False;
    edtMontantTransfert.Visible:=False;
    btnValideTransfert.Visible:=False;
    edtMessage.Visible:=False;
    memoSolde.Visible:=True;
    edtPhone.Visible:=False;
    edtLabelPhone.Visible:=False;

    memoSolde.Text:='Votre solde actuelle est : '+intToStr(solde);
end;

end.
