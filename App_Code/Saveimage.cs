using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Drawing.Imaging;

namespace GymMvc.Models
{
    public class Saveimage
    {
        public static string savedocumentinfolder(string ImgSource, string imgprefix)
        {
            string FileSaveName = "";
            if (ImgSource != "")
            {
                string FileName = GetImageName(imgprefix);
                string path = HttpContext.Current.Server.MapPath("~/uploadedimages/");
                String[] substrings = (ImgSource).Split(',');
                string header = substrings[0];
                string imgData = substrings[1];

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string TempPath = HttpContext.Current.Server.MapPath("~/img/CatalougeImg/");
                if (!Directory.Exists(TempPath))
                {
                    Directory.CreateDirectory(TempPath);
                }
                File.WriteAllBytes(TempPath + FileName, Convert.FromBase64String(imgData));
                VaryQualityLevel(TempPath + FileName, path + FileName);
                if (File.Exists(TempPath + FileName))
                {
                    File.Delete(TempPath + FileName);
                }
                FileSaveName = FileName;

            }
            return FileSaveName;
            //string uploadfile = string.Empty;
            //string ServerPathName = HttpRuntime.AppDomainAppPath;
            //string filepath = HttpContext.Current.Server.MapPath("~/uploadedimages/");
            //if (!System.IO.Directory.Exists(filepath))
            //{
            //    System.IO.Directory.CreateDirectory(filepath);
            //}

            //if (ImgSource != "")
            //{
            //    uploadfile = GetImageName(imgprefix);
            //    using (FileStream fs = new FileStream(filepath + uploadfile, FileMode.Create))
            //    {
            //        using (BinaryWriter bw = new BinaryWriter(fs))
            //        {
            //            byte[] data = Convert.FromBase64String(ImgSource);
            //            bw.Write(data);
            //            bw.Close();
            //        }
            //    }
            //}
            //return uploadfile;
        }

        public static string GetImageName(string imageprefix)
        {
            if (imageprefix == "")
            {
                imageprefix = "uploads";
            }
            string ImageName = "";
            Random random = new Random();
            int ran = random.Next(1000, 9999);
            string x = DateTime.Now.ToString("yyyyMMddhhmmss", CultureInfo.InvariantCulture);
            ImageName = imageprefix + x + ran + ".png";
            return ImageName;
        }

        private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                var newWidth = (int)(image.Width * scaleFactor);
                var newHeight = (int)(image.Height * scaleFactor);
                var thumbnailImg = new Bitmap(newWidth, newHeight);
                var thumbGraph = Graphics.FromImage(thumbnailImg);
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
                thumbGraph.DrawImage(image, imageRectangle);
                thumbnailImg.Save(targetPath, image.RawFormat);
            }
        }



        public static bool CheckAllFileMimeType(string MimeType)
        {
            bool result = false;
            switch (MimeType)
            {
                case "89504e47":
                case "47494638":
                case "ffd8ffe0":
                case "3026b275":
                case "25504446":
                case "00018":
                case "1a45dfa3":
                case "4f676753":
                case "464c561":
                case "38425053":
                case "504b34":
                    result = true;
                    break;
                default:
                    break;
            }
            return result;
        }

        public static string getAllMimeName(string MimeType)
        {
            string FileType = "";
            switch (MimeType)
            {
                case "89504e47":
                    FileType = "png";
                    break;
                case "47494638":
                    FileType = "gif";
                    break;
                case "ffd8ffe0":
                    FileType = "jpeg";
                    break;
                case "3026b275":
                    FileType = "mp4";
                    break;
                case "25504446":
                    FileType = "pdf";
                    break;
                case "00018":
                    FileType = "mp4";
                    break;
                case "1a45dfa3":
                    FileType = "mp4";
                    break;
                case "4f676753":
                    FileType = "mp4";
                    break;
                case "464c561":
                    FileType = "mp4";
                    break;
                case "38425053":
                    FileType = "psd";
                    break;
                case "504b34":
                    FileType = "xlsx";
                    break;
                default:
                    break;
            }
            return FileType;
        }
        public static string getFileRandomName()
        {
            Random random = new Random();
            int ran = random.Next(100, 999);
            string x = DateTime.Now.ToString("yyyyMMdd-", CultureInfo.InvariantCulture);
            return x + ran;
        }

        public static void VaryQualityLevel(string TempFilePath, string PerFilePath)
        {
            try
            {
                Bitmap bmp = new Bitmap(TempFilePath);
                ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);
                System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
                EncoderParameters myEncoderParameters = new EncoderParameters(1);
                EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 50L);
                myEncoderParameters.Param[0] = myEncoderParameter;
                bmp.Save(PerFilePath, jgpEncoder, myEncoderParameters);
                bmp.Dispose();
            }
            catch (Exception ex)
            {

            }
        }

        public static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();

            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

    }
}