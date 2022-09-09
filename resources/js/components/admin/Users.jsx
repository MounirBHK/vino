import React from "react";
import {
    List,
    Datagrid,
    TextField,
    TopToolbar,
    CreateButton,
    DateField,
    BooleanField,
} from "react-admin";

function Users() {
    const hostOriginURL = window.location.origin;

    return (
        <React.Fragment>
            <List>
                <Datagrid>
                    <TextField source="name" />
                    <TextField source="email" />
                    <TextField source="prenom" />
                    <TextField source="nom" />
                </Datagrid>
            </List>
        </React.Fragment>
    );
}

export default Users;
