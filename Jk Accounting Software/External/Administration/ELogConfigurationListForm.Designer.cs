﻿namespace Jk_Accounting_Software.External.Administration
{
    partial class ELogConfigurationListForm
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ELogConfigurationListForm));
            ((System.ComponentModel.ISupportInitialize)(this.VMasterDataTable)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer)).BeginInit();
            this.splitContainer.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnClose
            // 
            this.btnClose.FlatAppearance.BorderColor = System.Drawing.SystemColors.Control;
            this.btnClose.FlatAppearance.BorderSize = 0;
            this.btnClose.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Maroon;
            this.btnClose.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Maroon;
            this.btnClose.Location = new System.Drawing.Point(803, 0);
            // 
            // ELogConfigurationListForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Caption = "Log Configuration";
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns"))));
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns1"))));
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns2"))));
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns3"))));
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns4"))));
            this.Columns.Add(((JkComponents.JkColumn)(resources.GetObject("$this.Columns5"))));
            this.CommandText = "SELECT Id, Caption, TableName, Track, [Enable], TriggerName\r\nFROM tblSystemLogTab" +
    "leConfig\r\nORDER BY Caption";
            this.Name = "ELogConfigurationListForm";
            this.OpenFormName = "ELogConfigurationForm";
            this.Parameters.Add(((JkComponents.JkFormParameter)(resources.GetObject("$this.Parameters"))));
            this.Size = new System.Drawing.Size(836, 481);
            this.ZLoadColumns = true;
            this.ZLoadGrid = true;
            ((System.ComponentModel.ISupportInitialize)(this.VMasterDataTable)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer)).EndInit();
            this.splitContainer.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
    }
}
