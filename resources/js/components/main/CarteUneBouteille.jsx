import React from "react";
import "./CarteUneBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
import CircleIcon from "@mui/icons-material/Circle";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
    faEarthAmerica,
    faCalendar,
    faMap,
    faSackDollar,
    faTractor,
    faDroplet,
} from "@fortawesome/free-solid-svg-icons";
import { useNavigate, useLocation } from "react-router-dom";

function CarteUneBouteille({ bouteille, gereQuantite }) {
    //console.log("bouteille:", bouteille);
    const navigate = useNavigate();
    const { state: stateBouteille } = useLocation();
    const bouteilleReceived = bouteille || stateBouteille;
    //console.log("state:", stateBouteille);
    const url = bouteilleReceived.url_img;
    const urlNoParam = url.split("?")[0];

    return (
        <div className="Carte-une-bouteille">
            <div className="couleur">
                <p className={bouteilleReceived.type}>
                    <CircleIcon sx={{ fontSize: 150, top: 250, left: 200 }} />
                </p>
                <p className={bouteilleReceived.type}>
                    <CircleIcon sx={{ fontSize: 50, top: 300, left: 100 }} />
                </p>
                <p className={bouteilleReceived.type}>
                    <CircleIcon sx={{ fontSize: 250, top: 150, left: 55 }} />
                </p>
                <p className={bouteilleReceived.type}>
                    <CircleIcon sx={{ fontSize: 200, top: 75, left: 110 }} />
                </p>
                <p className={bouteilleReceived.type}>
                    <CircleIcon sx={{ fontSize: 75, top: 180, left: 30 }} />
                </p>
            </div>
            <div className="nom">
                <h2>{bouteilleReceived.nom_bouteille}</h2>
            </div>
            <div className="grid">
                <div className="bouteille-img">
                    <img src={urlNoParam} alt="bouteille" />
                </div>
                <div className="pays icon">
                    <FontAwesomeIcon icon={faEarthAmerica} />
                    <p>
                        <b>pays</b>
                        <br />
                        {bouteilleReceived.pays}
                    </p>
                </div>
                <div className="producteur icon">
                    <FontAwesomeIcon icon={faTractor} />
                    <p>
                        <b>producteur</b> <br />
                        {bouteilleReceived.producteur}
                    </p>
                </div>
                <div className="region icon">
                    <FontAwesomeIcon icon={faMap} />
                    <p>
                        <b>region</b>
                        <br />
                        {bouteilleReceived.region}
                    </p>
                </div>

                <div className="alcool icon">
                    <FontAwesomeIcon icon={faDroplet} />
                    <p>
                        <b>alcool</b>
                        <br />
                        {bouteilleReceived.degre_alcool} %
                    </p>
                </div>
                <div className="millesime icon">
                    <FontAwesomeIcon icon={faCalendar} />
                    <p>
                        <b>millesime</b>
                        <br />
                        {bouteilleReceived.millesime}
                    </p>
                </div>
                <div className="prix icon">
                    <FontAwesomeIcon icon={faSackDollar} />
                    <p>
                        <b>prix</b>
                        <br />
                        {bouteilleReceived.prix_saq} $
                    </p>
                </div>
            </div>
            <div className="quantite icon">
                <h3>Qté</h3>
                <p>
                    <span>{bouteilleReceived.quantite}</span>
                </p>
            </div>
            <ButtonGroup variant="text" className="options">
                <Button
                    onClick={() =>
                        navigate("/dashboard/modifierBouteille", {
                            state: bouteilleReceived,
                        })
                    }
                >
                    Modifier
                </Button>
                <Button
                    value={1}
                    onClick={(e) =>
                        gereQuantite(
                            bouteilleReceived.id_cellier,
                            bouteilleReceived.id_bouteille,
                            bouteilleReceived.quantite,
                            e.target.value,
                            bouteilleReceived
                        )
                    }
                >
                    Ajouter
                </Button>
                <Button
                    value={-1}
                    onClick={(e) =>
                        gereQuantite(
                            bouteilleReceived.id_cellier,
                            bouteilleReceived.id_bouteille,
                            bouteilleReceived.quantite,
                            e.target.value,
                            bouteilleReceived
                        )
                    }
                >
                    Boire
                </Button>
            </ButtonGroup>
        </div>
    );
}

export default CarteUneBouteille;
