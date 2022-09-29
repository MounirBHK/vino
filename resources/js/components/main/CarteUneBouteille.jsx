import React from "react";
import "./CarteUneBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
import {
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    DialogActions,
} from "@mui/material";
import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
    faEarthAmerica,
    faCalendar,
    faMap,
    faSackDollar,
    faTractor,
    faDroplet,
    faCircle
} from "@fortawesome/free-solid-svg-icons";
import { useNavigate, useLocation } from "react-router-dom";

function CarteUneBouteille({ bouteille, gereQuantite, gereSelectCellier }) {
    const navigate = useNavigate();
    const { state: stateBouteille } = useLocation();
    const bouteilleReceived = bouteille || stateBouteille;
    const url = bouteilleReceived.url_img;
    const urlNoParam = url.split("?")[0];
    const [openSuppDialog, setOpenSuppDialog] = useState(false);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const deleteBoutCell = async (idRef, idBtSupp) => {
        return await axios.delete(
            hostOriginURL + `/api/deleteBoutCellier/${idRef}/${idBtSupp}`,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const handleBoire = (value) => {
        console.log(bouteilleReceived.quantite);
        if (bouteilleReceived.quantite > 1)
            gereQuantite(
                bouteilleReceived.id_cellier,
                bouteilleReceived.id_bouteille,
                bouteilleReceived.quantite,
                value,
                bouteilleReceived
            );
        else setOpenSuppDialog(true);
    };

    const handleCloseDialog = () => {
        setOpenSuppDialog(false);
    };

    const handleSuppBouteille = () => {
        deleteBoutCell(
            bouteilleReceived.id_cellier,
            bouteilleReceived.id_bouteille
        ).then(() => {
            navigate(-1);
        });
    };

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
                        pays
                        <br />
                        <strong>{bouteilleReceived.pays}</strong>
                    </p>
                </div>
                <div className="producteur icon">
                    <FontAwesomeIcon icon={faTractor} />
                    <p>
                        producteur <br />
                        <strong>{bouteilleReceived.producteur}</strong>
                    </p>
                </div>
                <div className="region icon">
                    <FontAwesomeIcon icon={faMap} />
                    <p>
                        region
                        <br />
                        <strong>{bouteilleReceived.region}</strong>
                    </p>
                </div>
                <div className="alcool icon">
                    <FontAwesomeIcon icon={faDroplet} />
                    <p>
                        alcool
                        <br />
                        <strong>{bouteilleReceived.degre_alcool}</strong>
                    </p>
                </div>
                <div className="millesime icon">
                    <FontAwesomeIcon icon={faCalendar} />
                    <p>
                        millesime
                        <br />
                        <strong>{bouteilleReceived.millesime}</strong>
                    </p>
                </div>
                <div className="prix icon">
                    <FontAwesomeIcon icon={faSackDollar} />
                    <p>
                        prix
                        <br />
                        <strong>{bouteilleReceived.prix_saq}$</strong>
                    </p>
                </div>
            </div>
            <div className="quantite icon">
                    <span>Qté</span>
                    <strong>{bouteilleReceived.quantite}</strong>
            </div>
            <ButtonGroup variant="text" className="options">
                <Button
                    disabled={false}
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
                <Button value={-1} onClick={(e) => handleBoire(e.target.value)}>
                    Boire
                </Button>
            </ButtonGroup>
            <Dialog open={openSuppDialog}>
                <DialogContent>
                    <DialogTitle id="attention">ATTENTION</DialogTitle>
                    <DialogContentText id="alert-dialog-description">
                        Voulez vous supprimer cette bouteille?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={handleCloseDialog}
                        autoFocus
                    >
                        Annuler
                    </Button>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={handleSuppBouteille}
                    >
                        Supprimer
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    );
}

export default CarteUneBouteille;
