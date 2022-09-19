import React from "react";
import "./CarteUneBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
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
    const navigate = useNavigate();
    const { state: stateBouteille } = useLocation();
    const bouteilleReceived = bouteille || stateBouteille;
    const url = bouteilleReceived.url_img;
    const urlNoParam = url.split("?")[0];
    return (
        <div className="Carte-une-bouteille">
            <svg
                className="background"
                id="Calque_2"
                data-name="Calque 2"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 194.4 269.22"
            >
                <g
                    className={bouteilleReceived.type}
                    id="Calque_1-2"
                    data-name="Calque 1"
                >
                    <circle
                        className="cls-1"
                        cx="105.42"
                        cy="180.23"
                        r="88.99"
                    />
                    <circle className="cls-1" cx="76.29" cy="146.52" r="24.4" />
                    <circle className="cls-1" cx="47.17" cy="68.21" r="24.4" />
                    <circle
                        className="cls-1"
                        cx="154.66"
                        cy="104.27"
                        r="29.02"
                    />
                    <circle
                        className="cls-1"
                        cx="31.97"
                        cy="205.04"
                        r="31.97"
                    />
                    <circle
                        className="cls-1"
                        cx="138.86"
                        cy="214.34"
                        r="31.15"
                    />
                    <circle
                        className="cls-1"
                        cx="111.08"
                        cy="63.01"
                        r="14.56"
                    />
                    <circle className="cls-1" cx="86.13" cy="14.56" r="14.56" />
                </g>
            </svg>
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
                    disabled={true}
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
