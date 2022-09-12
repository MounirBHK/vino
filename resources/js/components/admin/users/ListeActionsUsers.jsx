import { TopToolbar, CreateButton, Button } from "react-admin";
import DeleteIcon from "@mui/icons-material/Delete";

const ListeActionsUsers = () => (
    <TopToolbar>
        <CreateButton />
        <Button label="Supprimer">
            <DeleteIcon />
        </Button>
    </TopToolbar>
);

export default ListeActionsUsers;
