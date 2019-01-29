﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Free_Accounting_Software.Internal;

namespace Free_Accounting_Software.Testing
{
    [TestClass]
    public class MainApplication
    {
        [TestMethod]
        public void TestMainApplication()
        {
            IControlHolderForm mainInterface = new IControlHolderForm();

            try
            {
                try
                {
                    mainInterface.ShowInTaskbar = false;
                    mainInterface.ShowDialog();
                }
                finally
                {
                    mainInterface.Close();
                }
            }
            catch(Exception ex)
            {
                Assert.Fail(ex.Message);
                return;
            }
        }
    }
}
