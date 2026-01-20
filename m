Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FC477E2D
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935990; cv=none; b=rCOKsbGsDLGcNch2K+aWEkXu5Mhxb9J+mS39l6b8D3KsejSBX9woNJGjkP5IgqtDId0BPphBPf47FZEbS4JTWnaRH0tLe/Z8RUiyAk6kBwr4KvwD7p2xBLlmG9AUqPo6drE6NnrEeXSCH4x3tKY9N5zIGiaV4jqqmUz7k/iZr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935990; c=relaxed/simple;
	bh=8E5W83s8zZhlgtflURC3mkpser20n9zf1XMNgYJpTwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbPqfANL2pUV+ThQcNS5IOZvkcTB3rYcBbTbJhaO4ZlWb1OitBC5W0i9Rim5Bagv+hhUEdua2HdedbHNoW+mR9BbcrKW+MjUPXGFPCsM70/p7mFrRD9lYm/thEVcJvOXww75RyWCemCD9DVIx0/PcK0CbA6n1CMubEyNlYyxjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CW8vH1cX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CW8vH1cX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso850495e9.1
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 11:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935986; x=1769540786; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTZeNoXj7ciqJdUwytCB4biiCQ0vzYC8/NabwXP8eYU=;
        b=CW8vH1cXZjtnOjQ5VUqNJXcy0rvIFbc6acpdoHE+B9D4Qw14ujgwMdMEtE1zHxxcWk
         0DxSFBde/MrZCCNyCO4TazUxBLW8erP2pk4t8GFmL1bgfZtxwm2S/jkcEkF7O0+Mh2Fv
         EBys2ph7TfFZ1O2lZHBaw7ztMhuV7zMESvVhew6Hh0a0p/XxjtxD5CdZml6MguqQESb0
         llFQRw83vf+Cm2+6BuC8noXw4s0CeIawy2Co6wPTE9OyBso58H9V7apgjAWZVDqmMoru
         YGfmsuG4GfNoya7+gdqjGfN8GGZBfEWEa7locbIr4gEFfZrPEl42hf+XtjsQEfEiTAj9
         fDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935986; x=1769540786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTZeNoXj7ciqJdUwytCB4biiCQ0vzYC8/NabwXP8eYU=;
        b=bMV34sD9X0fv1mNjOaVhvdEH3NmCSCD1FVIENj+FSMlXdmwJKxeJEg9NvFNE5Iy2Tp
         ZxMqxe+GVRQg03j0a10p+fpd4HWZIxsSsVYo2S/bt4s1mdCvKMcm7RPZgCD0Stg0uipg
         rjF16E66qA8V5GnYj+AD5olDAntBucGBFjUh2vL7ui16aOAKY/FlPmEa14dCatXXLPGb
         LsAaXJQc82QGLsAXfUQXx5RHApqFA1WHqdteM6klYlZYF8QfyK3fa0fyY9zabIsNlGfG
         fqpqZQ3/oWH9uakpzAZbj/z8lIMKX1J/gIszB8vUJKKGvIqNe/XDsGVQfwtu+JgNWBZu
         b7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV/fpLjM9qqPR1c9I91Pcx5gJqNkd36j/m55aN23a1azwwDL/1WJw96mkS6VSL8oscRp8b7z4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpcK/13JatIgfaNgUGWRl9BIjKPL0h8YBPlzjiMmHzGtJf+WSO
	qU4keKwX9IR3okqXynMOl5M1MyshDHhoRJsoBsUisH3fLZBsfQiHMd5s
X-Gm-Gg: AY/fxX6nHHNUYKqFU2MuI1UFUIQSXurl6riMTrnPbKEaE6iHqTF5mFs1HHu9/k8HbXV
	gKJvFcVc2yWcVcwUawIkCEO3vkOOpvwNbCdcwzb4LGdegmVGoH/3j7ItXgooE18mYEgQVK4E4U1
	uiPyLZozGwID/D70pS95kzWyVWpsYk3XeaLveS0w3T3AzLyk4+E9O4PjlyjA3RnZe4+VYK5vqbj
	7gde0CQoFeUkNrb096q6fbSONZXstKCgWcKWpWG/hibUVGvJuj1EjVNlNRaVbEIzSADhmNlqZja
	jAuLEXvsI5tnHF6bNXfNmiGr1bEWnLG1IUGxxktAEoYODFWAiQpAuEAx7weZtExBLQ8+nnlail+
	KCkvJS4rKqtdeXlm2wP4/cGJW59oofbJpQ+aPASD73N+6+uKC4qs48P+8K7iZOgVZ+Ue5a1pV5h
	PGTDOn2B2bFr5ZTuVQa+Dtsda1FXISA67AI1gmzwJbraMfPBqo9KKLCzI=
X-Received: by 2002:a05:600c:4e89:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-47f428ae048mr207099495e9.7.1768935986040;
        Tue, 20 Jan 2026 11:06:26 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:25 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:07 +0400
Subject: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec driver
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=7443;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=8E5W83s8zZhlgtflURC3mkpser20n9zf1XMNgYJpTwc=;
 b=5SXa+MAtOSwv7YCD5OSx/FZfbU/cJTV6VZaWJato1ZDqTKCiWouC+1VTjWMT2wvVJaUxHsqkN
 Jy4eTqIbgvFA9lnCPCUtynB+HHXpKbS2heJS4xsZa6A1jVfaTOWMPNO
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Codec DAI endpoint for TXDAC. The codec does only a few things
- set up decimation
- enable codec and I2S output
- ensures the driver doesn't have dac overwrite enabled. (unmute the
  output)

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig             |  11 +-
 sound/soc/sophgo/Makefile            |   1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 204 +++++++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index 12d1a57ea308..e4786f087589 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,10 +28,19 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
-
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc
 
+config SND_SOC_CV1800B_DAC_CODEC
+	tristate "Sophgo CV1800B/SG2002 internal DAC codec"
+	depends on SND_SOC
+	help
+	  This driver provides an ASoC codec DAI for playback and basic
+	  control of the TXDAC registers.
+
+	  Say Y or M to build support for the Sophgo CV1800B
+	  internal analog DAC codec block (TXDAC).
+	  The module will be called cv1800b-sound-dac
 
 endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
index c654d6059cbd..ec8dd31efddd 100644
--- a/sound/soc/sophgo/Makefile
+++ b/sound/soc/sophgo/Makefile
@@ -2,3 +2,4 @@
 # Sophgo Platform Support
 obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
 obj-$(CONFIG_SND_SOC_CV1800B_ADC_CODEC) += cv1800b-sound-adc.o
+obj-$(CONFIG_SND_SOC_CV1800B_DAC_CODEC) += cv1800b-sound-dac.o
diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
new file mode 100644
index 000000000000..ccf386174639
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal DAC codec for cv1800b based CPUs
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <sound/soc.h>
+#include <linux/io.h>
+
+#define CV1800B_TXDAC_CTRL0   0x00
+#define CV1800B_TXDAC_CTRL1   0x04
+#define CV1800B_TXDAC_STATUS  0x08
+#define CV1800B_TXDAC_AFE0    0x0c
+#define CV1800B_TXDAC_AFE1    0x10
+#define CV1800B_TXDAC_ANA0    0x20
+#define CV1800B_TXDAC_ANA1    0x24
+#define CV1800B_TXDAC_ANA2    0x28
+
+/* cv1800b_TXDAC_CTRL0 */
+#define REG_TXDAC_EN GENMASK(0, 0)
+#define REG_I2S_RX_EN GENMASK(1, 1)
+
+/* cv1800b_TXDAC_CTRL1 */
+#define REG_TXDAC_CIC_OPT GENMASK(1, 0)
+
+/* cv1800b_TXDAC_AFE0 */
+#define REG_TXDAC_INIT_DLY_CNT GENMASK(5, 0)
+
+/* cv1800b_TXDAC_ANA2 */
+#define TXDAC_OW_VAL_L_MASK GENMASK(7, 0)
+#define TXDAC_OW_VAL_R_MASK GENMASK(15, 8)
+#define TXDAC_OW_EN_L_MASK GENMASK(16, 16)
+#define TXDAC_OW_EN_R_MASK GENMASK(17, 17)
+
+struct cv1800b_priv {
+	void __iomem *regs;
+	struct device *dev;
+};
+
+enum decimation_values {
+	DECIMATION_64 = 0,
+	DECIMATION_128,
+	DECIMATION_256,
+	DECIMATION_512,
+};
+
+static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL0);
+	val = u32_replace_bits(val, enable, REG_TXDAC_EN);
+	val = u32_replace_bits(val, enable, REG_I2S_RX_EN);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
+}
+
+static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_ANA2);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_L_MASK);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_R_MASK);
+	writel(val, priv->regs + CV1800B_TXDAC_ANA2);
+}
+
+static int cv1800b_dac_decimation(struct cv1800b_priv *priv, u8 dec)
+{
+	u32 val;
+
+	if (dec > 3)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL1);
+	val = u32_replace_bits(val, dec, REG_TXDAC_CIC_OPT);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL1);
+	return 0;
+}
+
+static int cv1800b_dac_dly(struct cv1800b_priv *priv, u32 dly)
+{
+	u32 val;
+
+	if (dly > 63)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_AFE0);
+	val = u32_replace_bits(val, dly, REG_TXDAC_INIT_DLY_CNT);
+	writel(val, priv->regs + CV1800B_TXDAC_AFE0);
+	return 0;
+}
+
+static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+	int ret;
+	unsigned int rate = params_rate(params);
+
+	if (rate != 48000) {
+		dev_err(priv->dev, "rate %u is not supported\n", rate);
+		return -EINVAL;
+	}
+
+	cv1800b_dac_mute(priv, false);
+	/* minimal decimation for 48kHz is 64*/
+	ret = cv1800b_dac_decimation(priv, DECIMATION_64);
+	if (ret)
+		return ret;
+
+	/* value is taken from vendors driver 48kHz
+	 * tested on sg2000 and sg2002.
+	 */
+	ret = cv1800b_dac_dly(priv, 0x19);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cv1800b_dac_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		cv1800b_dac_enable(priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		cv1800b_dac_enable(priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_dac_dai_ops = {
+	.hw_params = cv1800b_dac_hw_params,
+	.trigger = cv1800b_dac_dai_trigger,
+};
+
+static struct snd_soc_dai_driver cv1800b_dac_dai = {
+	.name = "dac-hifi",
+	.playback = { .stream_name = "DAC Playback",
+		      .channels_min = 2,
+		      .channels_max = 2,
+		      .rates = SNDRV_PCM_RATE_48000,
+		      .formats = SNDRV_PCM_FMTBIT_S16_LE },
+	.ops = &cv1800b_dac_dai_ops,
+};
+
+static const struct snd_soc_component_driver cv1800b_dac_component = {
+	.name = "cv1800b-dac-codec",
+};
+
+static int cv1800b_dac_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	platform_set_drvdata(pdev, priv);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &cv1800b_dac_component,
+					       &cv1800b_dac_dai, 1);
+}
+
+static const struct of_device_id cv1800b_dac_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-sound-dac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800b_dac_of_match);
+
+static struct platform_driver cv1800b_dac_driver = {
+	.probe = cv1800b_dac_probe,
+	.driver = {
+		.name = "cv1800b-dac-codec",
+		.of_match_table = cv1800b_dac_of_match,
+	},
+};
+module_platform_driver(cv1800b_dac_driver);
+
+MODULE_DESCRIPTION("DAC codec for CV1800B");
+MODULE_AUTHOR("Anton D. Stavinskii <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

