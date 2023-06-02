document.addEventListener("DOMContentLoaded", () => {
  //Variables globales
  const casosData = [];

  const createCasosTable = async () => {
    try {
      const response = await fetch("casosDataTable.aspx", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });
      if (!response.ok) {
        throw new Error("Request failed with status: " + response.status);
      }
      const data = await response.json();

      data.forEach((client) => {
        casosData.push(client);
      });
    } catch (error) {
      console.error("Error:", error);
      alert("Error:", error);
    }
  };
  const printData = async () => {
    await createCasosTable();
    console.log("Data: ", casosData);
  };
  printData();
});
