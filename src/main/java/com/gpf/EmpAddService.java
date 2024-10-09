/*
 * package com.gpf;
 * 
 * import java.io.File; import java.io.FileOutputStream; import
 * java.io.IOException; import java.util.Properties;
 * 
 * import com.pojo.HRSAPOUTPUT; import com.pojo.User;
 * 
 * 
 * 
 * public class EmpAddService {
 * 
 * User userobj = null; // public String url =
 * "http://10.50.50.165:2020/SapReport/JavaCodeGeeks/Hr/getemploye"; public
 * static void main(String[] args) { try {
 * 
 * POSTRequest("20857");
 * 
 * } catch (Exception e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } }
 * 
 * public HRSAPOUTPUT POSTRequest(String s) throws IOException { StringBuffer
 * response = null; HRSAPOUTPUT data = new HRSAPOUTPUT(); //URL obj = new
 * URL("http://10.50.50.165:2020/SapReport/JavaCodeGeeks/Hr/getemploye");
 * //SAPRS/Hr/getemploye // URL obj = new URL(""); try { data = getEmpData(s); }
 * catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace();
 * } // URL obj = new URL("http://10.50.50.165:8080/SAPRS/Hr/getemploye"); //
 * HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
 * // postConnection.setRequestMethod("POST"); //
 * postConnection.setRequestProperty("Content-Type", "text/plain"); //
 * postConnection.setDoOutput(true); // OutputStream os =
 * postConnection.getOutputStream(); // os.write(s.getBytes()); // os.flush();
 * // os.close(); // int responseCode = postConnection.getResponseCode(); //
 * System.out.println("POST Response Code :  " + responseCode); // if
 * (responseCode == HttpURLConnection.HTTP_OK) { //success // BufferedReader in
 * = new BufferedReader(new InputStreamReader( //
 * postConnection.getInputStream())); // String inputLine; // response = new
 * StringBuffer(); // while ((inputLine = in .readLine()) != null) { //
 * response.append(inputLine); // } in .close(); // // print result //
 * System.out.println(response.toString()); // } else { //
 * System.out.println("POST NOT WORKED"); // } return data; }
 * 
 * private void createDestinationDataFile(String destinationName, Properties
 * connectProperties) { File destCfg = new
 * File(destinationName+".jcoDestination"); try { FileOutputStream fos = new
 * FileOutputStream(destCfg, false); connectProperties.store(fos,
 * "for tests only !"); fos.close(); } catch (Exception e) { throw new
 * RuntimeException("Unable to create the destination files", e); } }
 * 
 * public HRSAPOUTPUT getEmpData(String id) throws Exception{ // JCoDestination
 * destination = null; HRSAPOUTPUT hrsapoutput = new HRSAPOUTPUT(); //
 * destination = JCoDestinationManager.getDestination(DEVELOPMENT_POOL); String
 * DESTINATION_NAME1 = "ABAP_PRODUCTION_POOL"; Properties connectProperties =
 * new Properties();
 * connectProperties.setProperty(DestinationDataProvider.JCO_ASHOST,
 * "10.16.1.170");
 * connectProperties.setProperty(DestinationDataProvider.JCO_SYSNR, "50");
 * connectProperties.setProperty(DestinationDataProvider.JCO_CLIENT, "999");
 * connectProperties.setProperty(DestinationDataProvider.JCO_USER, "9000 PO P");
 * connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD,
 * "dtrtrack");//"ug6kl1ow:40om|vZApN3mo1j58^rnPpYN6Tq3]Ql7;KijI)B");
 * connectProperties.setProperty(DestinationDataProvider.JCO_LANG, "EN");
 * createDestinationDataFile(DESTINATION_NAME1,connectProperties); destination =
 * JCoDestinationManager.getDestination(DESTINATION_NAME1); JCoRepository
 * repository = destination.getRepository(); JCoFunction function =
 * repository.getFunction("ZHR_CHECK_PERNR"); String E_ERROR = ""; if (function
 * != null) { JCoParameterList userinput = function.getImportParameterList();
 * //if (true) { userinput.setValue("I_PERNR", id); //}
 * function.execute(destination); JCoParameterList expList =
 * function.getExportParameterList();
 * 
 * for(JCoField record:expList) { System.out.println(record.getName()); }
 * E_ERROR = function.getExportParameterList().getString("E_REMARKS");
 * hrsapoutput.setE_ERROR(E_ERROR); String
 * E_PTEXT=function.getExportParameterList().getString("E_PTEXT");
 * System.out.println("SAPDtrEntry.sapConnectUsingPool(E_PTEXT):-----"+E_PTEXT);
 * hrsapoutput.setE_PTEXT(E_PTEXT); String
 * E_BTEXT=function.getExportParameterList().getString("E_BTEXT");
 * hrsapoutput.setE_BTEXT(E_BTEXT); String
 * E_NAME=function.getExportParameterList().getString("E_NAME");
 * hrsapoutput.setE_NAME(E_NAME); hrsapoutput.setE_ID(id);
 * System.out.println("SAPDtrEntry.sapConnectUsingPool(E_NAME):------"+E_NAME);
 * System.out.println("SAPDtrEntry.sapConnectUsingPool(E_BTEXT):------"+E_BTEXT)
 * ; System.out.println("CscToSap.cscChgDetails(E_ERROR)"+E_ERROR);
 * 
 * } else { throw new RuntimeException("ZHR_CHECK_PERNR not found in SAP."); }
 * return hrsapoutput; }
 * 
 * 
 * public User convertJsonToJavaObj(String data) { userobj = new User();
 * JSONObject jsonObj = new JSONObject(data); if(jsonObj.isNull("e_ID")) {
 * userobj.setError("Invalid ID"); } else { String username =
 * jsonObj.getString("e_ID"); String empname = jsonObj.getString("e_NAME");
 * String error = jsonObj.getString("e_ERROR"); String designation =
 * jsonObj.getString("e_PTEXT");
 * if(error.equalsIgnoreCase("Employee not found.")) { //
 * userobj.setUsername(null); // userobj.setEmpname(null); //
 * userobj.setPassword(null); userobj.setError("User Not Found"); } else {
 * userobj.setUsername(username); userobj.setEmpname(empname);
 * userobj.setPassword(username); userobj.setDesignation(designation);
 * userobj.setAuthenticated(true); userobj.setInitPwdChange(false);
 * userobj.setGpfavailable(true); } }
 * 
 * // System.out.println( "id: " + username ); // System.out.println(
 * "empname: " + empname ); System.out.println(userobj.toString());
 * 
 * return userobj;
 * 
 * } }
 */