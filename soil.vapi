/* soil.vapi
 *
 * Copyright (C) 2014  Dmitry Golovin
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.
 *
 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Author:
 * 	Dmitry Golovin <dima@golovin.in>
 */

[CCode (lower_case_cprefix ="SOIL_", cheader_filename="SOIL/SOIL.h")]
namespace SOIL
{
    public enum Load {
        AUTO,
        L,
        LA,
        RGB,
        RGBA
    }

    public enum Flag {
        POWER_OF_TWO,
        MIPMAPS,
        TEXTURE_REPEATS,
        MULTIPLY_ALPHA,
        INVERT_Y,
        COMPRESS_TO_DXT,
        DDS_LOAD_DIRECT,
        NTSC_SAFE_RGB,
        CoCg_Y,
        TEXTURE_RECTANGLE
    }

    public enum SaveType {
        TGA,
        BMP,
        DDS
    }

    public enum HDR {
        RGBE,
        RGBdivA,
        RGBdivA2
    }

    public uint load_OGL_texture (string filename, Load force_channels, uint reuse_texture_ID, Flag flags);

    public uint load_OGL_cubemap (string x_pos_file, string x_neg_file,
                                    string y_pos_file, string y_neg_file,
                                    string z_pos_file, string z_neg_file,
                                    Load force_channels, uint reuse_texture_ID, Flag flags);

    public uint load_OGL_HDR_texture (string filename, HDR fake_HDR_format, int rescale_to_max,
                                    uint reuse_texture_ID, Flag flags);

    public uint load_OGL_texture_from_memory (
        [CCode (array_length_name = "buffer_length", array_length_type = "int")] uint8[] buffer,
                                    Load force_channels, uint reuse_texture_ID, Flag flags);

    public uint load_OGL_cubemap_from_memory (
        [CCode (array_length_name = "x_pos_buffer_length", array_length_type = "int")] uint8[] x_pos_buffer,
        [CCode (array_length_name = "x_neg_buffer_length", array_length_type = "int")] uint8[] x_neg_buffer,
        [CCode (array_length_name = "x_pos_buffer_length", array_length_type = "int")] uint8[] y_pos_buffer,
        [CCode (array_length_name = "y_neg_buffer_length", array_length_type = "int")] uint8[] y_neg_buffer,
        [CCode (array_length_name = "z_pos_buffer_length", array_length_type = "int")] uint8[] z_pos_buffer,
        [CCode (array_length_name = "z_neg_buffer_length", array_length_type = "int")] uint8[] z_neg_buffer,
                                    Load force_channels, uint reuse_texture_ID, Flag flags);

    public uint load_OGL_single_cubemap_from_memory (
        [CCode (array_length_name = "buffer_length", array_length_type = "int")] uint8[] buffer,
        [CCode (array_length = 6)] char[] face_order, Load force_channels, uint reuse_texture_ID, Flag flags);

    public uint create_OGL_texture ([CCode (array_length = false)] uint8[] data,
                                    int width, int height, int channels, uint reuse_texture_ID, Flag flags);

    public uint create_OGL_single_cubemap (
        [CCode (array_length = false)] uint8[] data, int width, int height, int channels,
        [CCode (array_length = 6)] char[] face_order, uint reuse_texture_ID, Flag flags);

    public int save_screenshot (string filename, SaveType image_type, int x, int y, int width, int height);

    [CCode (array_length = false)]
    public uint8[] load_image (string filename, out int width, out int height, out int channels, Load force_channels);

    [CCode (array_length = false)]
    public uint8[] load_image_from_memory (
        [CCode (array_length_name = "buffer_length", array_length_type = "int")] uint8[] buffer,
                                    out int width, out int height, out int channels, Load force_channels);

    public int save_image (string filename, SaveType image_type, int width, int height, int channels,
                                    [CCode (array_length = false)] uint8[] data);

    public string last_result ();
}
