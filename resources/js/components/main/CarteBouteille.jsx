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
    gereQuantite,
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
                    value={1}
                    onClick={(e) =>
                        gereQuantite(
                            idCellier,
                            idBouteille,
                            quantiteBouteille,
                            e.target.value
                        )
                    }
                >
                    Ajouter
                </Button>
                <Button
                    value={-1}
                    onClick={(e) =>
                        gereQuantite(
                            idCellier,
                            idBouteille,
                            quantiteBouteille,
                            e.target.value
                        )
                    }
                >
                    Boire
                </Button>
            </ButtonGroup>
        </Card>
    );
}

export default CarteBouteille;
