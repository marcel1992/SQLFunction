using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace GestureProject
{
    internal class Program
    {
        private static void Main()
        {
            //call sql user defined function
            using (var connection = new SqlConnection("Data Source=DESKTOP-MMG1IMI;Initial Catalog=WindowsControlDB;Integrated Security=True"))
            using (var command = connection.CreateCommand())
            {
                command.CommandText = "select * from dbo.GetGestureByName(@gestureName)";
                command.CommandType = CommandType.Text;
                var gestureName = new SqlParameter("@gestureName", SqlDbType.NVarChar)
                {
                    Direction = ParameterDirection.Input,
                    Value = "wave"
                };
                command.Parameters.Add(gestureName);

                command.Connection = connection;
                connection.Open();

                var da = new SqlDataAdapter(command);
                var ds = new DataSet();
                da.Fill(ds);

                var lstRows = ds.Tables[0].Rows.Cast<DataRow>().ToList();
                var finalList = new List<GetGestureByName_Result>();

                lstRows.All(x =>
                {
                finalList.Add(
                            new GetGestureByName_Result()
                            {
                                Gesture_name = x.ItemArray[0].ToString(),
                                Point_X = (double)x.ItemArray[1],
                                Point_Y = (double)x.ItemArray[2],
                                Point_Z = (double)x.ItemArray[3]
                            }
                        );

                    return true;
                }
                    );
                connection.Close();

                if(finalList.Any())
                {
                    finalList.ForEach(x =>
                    {
                        System.Console.WriteLine($"Gesture name:{x.Gesture_name}, point X:{x.Point_X}, point Y:{x.Point_Y}, point Z:{x.Point_Z}");
                    });
                }

            }
            System.Console.ReadKey();
        }
    }
}
