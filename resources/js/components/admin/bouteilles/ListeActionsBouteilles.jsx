import { TopToolbar, CreateButton, Button } from "react-admin";
import ImportExportIcon from "@mui/icons-material/ImportExport";

const ListeActionsBouteilles = ({ gereImportSAQ }) => (
    <TopToolbar>
        {/* <CreateButton /> */}
        <Button
            onClick={() => {
                gereImportSAQ();
            }}
            label="Importer SAQ"
        >
            <ImportExportIcon />
        </Button>
    </TopToolbar>
);

export default ListeActionsBouteilles;
