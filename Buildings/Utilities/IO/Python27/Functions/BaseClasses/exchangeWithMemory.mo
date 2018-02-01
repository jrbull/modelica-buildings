within Buildings.Utilities.IO.Python27.Functions.BaseClasses;
function exchangeWithMemory
  "Function that communicates with Python and passes a Python object in memory from one function invocation to the next"
  input String moduleName
    "Name of the python module that contains the function";
  input String functionName=moduleName "Name of the python function";
  input BaseClasses.PythonObject pytObj "Memory that holds the Python object";

  input Real    dblWri[max(1, nDblWri)] "Double values to write";
  input Integer intWri[max(1, nIntWri)] "Integer values to write";
  input String  strWri[max(1, nStrWri)] "String values to write";

  input Integer nDblWri(min=0) "Number of double values to write";
  input Integer nDblRea(min=0) "Number of double values to read";

  input Integer nIntWri(min=0) "Number of integer values to write";
  input Integer nIntRea(min=0) "Number of integer values to read";

  input Integer nStrWri(min=0) "Number of strings to write";
//  input Integer nStrRea(min=0) "Number of strings to read";
//  input Integer strLenRea(min=0)
//    "Maximum length of each string that is read. If exceeded, the simulation stops with an error";

  output Real    dblRea[max(1, nDblRea)] "Double values returned by Python";
  output Integer intRea[max(1, nIntRea)] "Integer values returned by Python";

  external "C" pythonExchangeValuesWithMemory(moduleName, functionName,
                                    dblWri, nDblWri,
                                    dblRea, nDblRea,
                                    intWri, nIntWri,
                                    intRea, nIntRea,
                                    strWri, nStrWri,
                                    pytObj)
    annotation (Library={"ModelicaBuildingsPython2.7",  "python2.7"},
      LibraryDirectory={"modelica://Buildings/Resources/Library"},
      IncludeDirectory="modelica://Buildings/Resources/C-Sources",
      Include="#include \"python27Wrapper.c\"",
      __iti_dll = "ITI_ModelicaBuildingsPython2.7.dll",
      __iti_dllNoExport = true);

  annotation (Documentation(info="<html>
<p>
This function exchanges data with Python.
It can be used for the case where the Python function returns an object,
and receives this object at its next invocation. This can be used
to pass memory from one invocation to the other.
See
<a href=\"modelica://Buildings.Utilities.IO.Python27.UsersGuide\">
Buildings.Utilities.IO.Python27.UsersGuide</a>
for instructions, and
<a href=\"modelica://Buildings.Utilities.IO.Python27.Functions.Examples\">
Buildings.Utilities.IO.Python27.Functions.Examples</a>
for examples.
</p>
</html>", revisions="<html>
<ul>
<li>
January 31, 2018, by Michael Wetter and Thierry Nouidui:<br/>
First implementation.
</li>
</ul>
</html>"));
end exchangeWithMemory;
