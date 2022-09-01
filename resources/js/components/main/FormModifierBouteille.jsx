import React from "react";
import "./FormModifierBouteille.scss";

function FormModifierBouteille({ idCellier, idBouteille }) {
    return (
        <React.Fragment>
            <h1>
                Modification d'une bouteille - Cellier: {idCellier} - Bouteille:{" "}
                {idBouteille}
            </h1>
            <form>
                <label htmlFor="description">Description:</label>
                <input type="text" name="description" id="description" />
                <button>Valider</button>
                <button>Annuler</button>
            </form>
        </React.Fragment>
    );
}

export default FormModifierBouteille;
