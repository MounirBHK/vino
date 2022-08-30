import React from "react";
import "./CarteBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
import { Card } from "@mui/material";

function CarteBouteille({
    nomBouteille,
    quantiteBouteille,
    paysBouteille,
    typeBouteille,
    imgUrlBouteille,
    millesimeBouteille,
    prixBouteille,
    idCellier,
    idBouteille,
}) {
    return (
        <Card className="Carte-bouteille">
            <div className="bouteille-img">
                <img src={imgUrlBouteille} alt="#" />
            </div>
            <div className="description">
                <p className="nom">Nom: {nomBouteille}</p>
                <p className="quantite">Quantité: {quantiteBouteille}</p>
                <p className="pays">Pays: {paysBouteille}</p>
                <p className="type">Type: {typeBouteille}</p>
                <p className="millesime">Millésime: {millesimeBouteille}</p>
                <p className="prix">Prix: {prixBouteille}</p>
            </div>
            <ButtonGroup className="options">
                <Button>Modifier</Button>
                <Button
                    onClick={() =>
                        incrementeQuantite(
                            idCellier,
                            idBouteille,
                            quantiteBouteille
                        )
                    }
                >
                    Ajouter
                </Button>
                <Button
                    onClick={() =>
                        decrementeQuantite(idCellier, quantiteBouteille)
                    }
                >
                    Boire
                </Button>
            </ButtonGroup>
        </Card>
    );
}

export default CarteBouteille;
