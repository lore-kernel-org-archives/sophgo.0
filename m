Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738C2E8E09
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681183; cv=none; b=PIuZRIek88axzT8ge9C/q/yhn2HjQ1/neJJqzstY1ZpGjdKGyhI4xnRx6pvrhNLJb5sG02sXlzvhl15mcl8FXluRA09JFax+2j7Xydc4+8fLcMupMOG18fU4w0RJTTaN1Nr8zP0dmTm9c7qzMzq2fTkI3/APNiDCh/JQGhu4+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681183; c=relaxed/simple;
	bh=yoqDZc5ZVlZgdU+bd4E5tzHezHO66wUqbgpf8bFY4E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSHImcaVq521V1Rmsjcsg/veoUZxNFkEdW19fS6i4daQs7P4iHP3JIKh1UtpsnB1qvJPsuRxuQKv1TBcW8gUwPPuKBRzHAeBabIKS+YiijwEgC52Y4N0c/4rUdDJcoFSTRlTB7rHwCxUwKiAjpLmCgnTq71KIHUpiYMwV0MiWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUAhOwH4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUAhOwH4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee0291921so20271115e9.3
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681177; x=1769285977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+UkR1HZFum2uQlZYRs91yhhWbIXUBFNThSz2GGApOk=;
        b=UUAhOwH4uM954RLVejmwEy4+QjFl/yPxq4miEiqdAr+GZeQbscJdlTY3hQUhvX4tFZ
         cmH8awwdDtsnhkPLWrIT2v5g+7u5IFHsejyY0G39zRJApD0LboYW4EnLua48EUudF6R1
         nIn5hm9I2A8ClxXmOw3J1OKNhpRMgZ922NdTAUD5mAWJ4JPmFQeb9OmMFnFPHEamX91g
         yJGlvHaFIVEElGnNZzA33H8MRJI0rvw27bR7IedNh1Fxox1aVeZ243W/dTPT4ofmrobF
         8ilvrHRcfon1uGbnb2z1Zxy7lvqs/NNh3CNT/m/2oPN0wdW9L+SLHq2dvjGhH8mRcI4h
         bc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681177; x=1769285977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+UkR1HZFum2uQlZYRs91yhhWbIXUBFNThSz2GGApOk=;
        b=HTk7SPju8FcnH/wG1LemUBrcoPX5WHNXMR0ZULN6Z132N2bLejQg1Kq3jPfmr1hzrV
         vt3kFiOBNK3/iG7ujJBjuuQAM0XAsJxv9ZOO4hh52n+xE0BSWFNFUD0K+xPGcI/EiL1D
         QVBhVnYDdfq7Ve1qg1jpYhZyoI0jex/ZqnqAYFhC7sWJFeDLE78y61GDL8KyE4suFfcL
         0/kuS8TwD8PaoJSds2oaNMwl1bLXpI5A7q7P3AiPrpTObQWbdyY62b+SNAms7WBVfljU
         KW0hyVMXkOggfHauniVXTvms+mMyspEex2hlg1/fStTIV6NeI1mU5Q5jaOR1G4N5PPyZ
         O68g==
X-Forwarded-Encrypted: i=1; AJvYcCUnrl43MrTYRygZBm6yVcF8bId0o2jn0QAlHcMw43xar+xSqEt8Tyz61kkUEARL5mAVhTT3/fg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5p8mQkU+iZMe8pMZH9OZgCaQJ+7U1ZyEnHWSF/wvUII+BUvLw
	L5Uf8GfdH2E+eLHeUSlBlhfckcReNK7vXRd5RSBsQMmq9/RkVvfy2EjW
X-Gm-Gg: AY/fxX7cJXVz+G6SNoR8xENfzmhD/Bw4sLOZJGNqHU0P6TSyTs0Z+xiMN7K6ZRWihig
	jkahzzKoH9JKlpWrwqxkmbjX6r8sg9NqJcnapbPW6p44zotFFnXb+CdAO1XF6Q7pts1VXvs6Lhh
	kg3prDs37hTmVS7hf8AkKSdoEb2tbx48J7l+c4Go7sJnw3diSlbc+PnKx/U7wIrOsFOAL0THatE
	PYQBrzWYizqVsjMuxQKD3j6XHyWuKcjC4VOMshgSn6Qol3T9DHZByL8nhIiIhN8XQ96T56IsjFO
	Fqusrkv+YZzGVY6mv076+3GuCy0qH0GD5BlByN3CntPuRBi2buP3yTtjUayuvRq3Yw0oB6HlF9P
	JW5HCtr8+s1os/JhgKNBM5LxyUyORnQclNFiCeMkpiv20PKdsb//pAtnoFHd8vBj8D3Ls5FmjPp
	x8Mv6xubj+OvmnIy2Bge9CTaZxp0y2mHWA/2VjEBRHolGTVuhtIHoe4+8=
X-Received: by 2002:a05:600c:a009:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-4801eb0ef0bmr62487135e9.28.1768681176483;
        Sat, 17 Jan 2026 12:19:36 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:36 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:56 +0400
Subject: [PATCH v2 4/7] ASoC: sophgo: add CV1800B internal ADC codec driver
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-4-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=11247;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=yoqDZc5ZVlZgdU+bd4E5tzHezHO66wUqbgpf8bFY4E4=;
 b=Kh3fdLaX4mnHZSrSNmx5C/yL+afTAzTi84PHGn/Q2uCiR3cSfuRe7KJiZvTBMw0s+/RANKNEz
 qLuXaWzmsl8CQcS8U2Xh8OCgN/Ht/G5jgeywp1j+hpJtSs2i2nBGF5Y
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Codec DAI endpoint for RXADC + basic controls.
THe codec have basic volume control. Which is
imlemented by lookup table for simplicity.
The codec expects set_sysclk callback to
adjust internal mclk divider.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig             |  12 ++
 sound/soc/sophgo/Makefile            |   1 +
 sound/soc/sophgo/cv1800b-sound-adc.c | 322 +++++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index 70f07d46c810..813ab30d6da3 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -17,4 +17,16 @@ config SND_SOC_CV1800B_TDM
 	  To compile the driver as a module, choose M here: the module will
 	  be called cv1800b_tdm.
 
+config SND_SOC_CV1800B_ADC_CODEC
+	tristate "Sophgo CV1800B/SG2002 internal ADC codec"
+	depends on SND_SOC
+	help
+	  This driver provides an ASoC codec DAI for capture and basic
+	  control of the RXADC registers.
+
+	  Say Y or M to build support for the Sophgo CV1800B
+	  internal analog ADC codec block (RXADC).
+	  The module will be called cv1800b-sound-adc
+
+
 endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
index 3f9f1d07227a..c654d6059cbd 100644
--- a/sound/soc/sophgo/Makefile
+++ b/sound/soc/sophgo/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 # Sophgo Platform Support
 obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
+obj-$(CONFIG_SND_SOC_CV1800B_ADC_CODEC) += cv1800b-sound-adc.o
diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
new file mode 100644
index 000000000000..794030b713e9
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal adc codec for cv1800b compatible SoC
+ *
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <sound/tlv.h>
+#include <sound/soc-component.h>
+#include <sound/control.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+
+#define CV1800B_RXADC_WORD_LEN 16
+#define CV1800B_RXADC_CHANNELS 2
+
+#define CV1800B_RXADC_CTRL0    0x00
+#define CV1800B_RXADCC_CTRL1   0x04
+#define CV1800B_RXADC_STATUS   0x08
+#define CV1800B_RXADC_CLK      0x0c
+#define CV1800B_RXADC_ANA0     0x10
+#define CV1800B_RXADC_ANA1     0x14
+#define CV1800B_RXADC_ANA2     0x18
+#define CV1800B_RXADC_ANA3     0x1c
+#define CV1800B_RXADC_ANA4     0x20
+
+/* CV1800B_RXADC_CTRL0 */
+#define REG_RXADC_EN                   GENMASK(0, 0)
+#define REG_I2S_TX_EN                  GENMASK(1, 1)
+
+/* CV1800B_RXADCC_CTRL1 */
+#define REG_RXADC_CIC_OPT              GENMASK(1, 0)
+#define REG_RXADC_IGR_INIT             GENMASK(8, 8)
+
+/* CV1800B_RXADC_ANA0 */
+#define REG_GSTEPL_RXPGA               GENMASK(12, 0)
+#define REG_G6DBL_RXPGA                GENMASK(13, 13)
+#define REG_GAINL_RXADC                GENMASK(15, 14)
+#define REG_GSTEPR_RXPGA               GENMASK(28, 16)
+#define REG_G6DBR_RXPGA                GENMASK(29, 29)
+#define REG_GAINR_RXADC                GENMASK(31, 30)
+#define REG_COMB_LEFT_VOLUME           GENMASK(15, 0)
+#define REG_COMB_RIGHT_VOLUME          GENMASK(31, 16)
+
+/* CV1800B_RXADC_ANA2 */
+#define REG_MUTEL_RXPGA                GENMASK(0, 0)
+#define REG_MUTER_RXPGA                GENMASK(1, 1)
+
+/* CV1800B_RXADC_CLK */
+#define REG_RXADC_CLK_INV              GENMASK(0, 0)
+#define REG_RXADC_SCK_DIV              GENMASK(15, 8)
+#define REG_RXADC_DLYEN                GENMASK(23, 16)
+
+enum decimation_values {
+	DECIMATION_64 = 0,
+	DECIMATION_128,
+	DECIMATION_256,
+	DECIMATION_512,
+};
+
+static const u32 cv1800b_gains[] = {
+	0x0001, /* 0dB */
+	0x0002, /* 2dB */
+	0x0004, /* 4dB */
+	0x0008, /* 6dB */
+	0x0010, /* 8dB */
+	0x0020, /* 10dB */
+	0x0040, /* 12dB */
+	0x0080, /* 14dB */
+	0x0100, /* 16dB */
+	0x0200, /* 18dB */
+	0x0400, /* 20dB */
+	0x0800, /* 22dB */
+	0x1000, /* 24dB */
+	0x2400, /* 26dB */
+	0x2800, /* 28dB */
+	0x3000, /* 30dB */
+	0x6400, /* 32dB */
+	0x6800, /* 34dB */
+	0x7000, /* 36dB */
+	0xA400, /* 38dB */
+	0xA800, /* 40dB */
+	0xB000, /* 42dB */
+	0xE400, /* 44dB */
+	0xE800, /* 46dB */
+	0xF000, /* 48dB */
+};
+
+struct cv1800b_priv {
+	void __iomem *regs;
+	struct device *dev;
+	unsigned int mclk_rate;
+};
+
+static int cv1800b_adc_setbclk_div(struct cv1800b_priv *priv, unsigned int rate)
+{
+	u32 val;
+	u32 bclk_div;
+	u64 tmp;
+
+	if (!priv->mclk_rate || !rate)
+		return -EINVAL;
+
+	tmp = priv->mclk_rate;
+	tmp /= CV1800B_RXADC_WORD_LEN;
+	tmp /= CV1800B_RXADC_CHANNELS;
+	tmp /= rate;
+	tmp /= 2;
+
+	if (!tmp) {
+		dev_err(priv->dev, "computed BCLK divider is zero\n");
+		return -EINVAL;
+	}
+
+	if (tmp > 256) {
+		dev_err(priv->dev, "BCLK divider %llu out of range\n", tmp);
+		return -EINVAL;
+	}
+
+	bclk_div = tmp - 1;
+	val = readl(priv->regs + CV1800B_RXADC_CLK);
+	val = u32_replace_bits(val, bclk_div, REG_RXADC_SCK_DIV);
+	/* Vendor value for 48kHz, tested on SG2000/SG2002 */
+	val = u32_replace_bits(val, 0x19, REG_RXADC_DLYEN);
+	writel(val, priv->regs + CV1800B_RXADC_CLK);
+
+	return 0;
+}
+
+static void cv1800b_adc_enable(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_RXADC_CTRL0);
+	val = u32_replace_bits(val, enable, REG_RXADC_EN);
+	val = u32_replace_bits(val, enable, REG_I2S_TX_EN);
+	writel(val, priv->regs + CV1800B_RXADC_CTRL0);
+}
+
+static unsigned int cv1800b_adc_calc_db(u32 ana0, bool right)
+{
+	u32 step_mask = right ? FIELD_GET(REG_GSTEPR_RXPGA, ana0) :
+				FIELD_GET(REG_GSTEPL_RXPGA, ana0);
+	u32 coarse = right ? FIELD_GET(REG_GAINR_RXADC, ana0) :
+			     FIELD_GET(REG_GAINL_RXADC, ana0);
+	bool g6db = right ? FIELD_GET(REG_G6DBR_RXPGA, ana0) :
+			    FIELD_GET(REG_G6DBL_RXPGA, ana0);
+
+	u32 step = step_mask ? __ffs(step_mask) : 0;
+
+	step = min(step, 12U);
+	coarse = min(coarse, 3U);
+
+	return 2 * step + 6 * coarse + (g6db ? 6 : 0);
+}
+
+static int cv1800b_adc_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	u32 val;
+	int ret;
+
+	ret = cv1800b_adc_setbclk_div(priv, rate);
+	if (ret) {
+		dev_err(priv->dev,
+			"could not set rate, check DT node for fixed clock\n");
+		return ret;
+	}
+
+	/* init adc */
+	val = readl(priv->regs + CV1800B_RXADCC_CTRL1);
+	val = u32_replace_bits(val, 1, REG_RXADC_IGR_INIT);
+	val = u32_replace_bits(val, DECIMATION_64, REG_RXADC_CIC_OPT);
+	writel(val, priv->regs + CV1800B_RXADCC_CTRL1);
+	return 0;
+}
+
+static int cv1800b_adc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		cv1800b_adc_enable(priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		cv1800b_adc_enable(priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cv1800b_adc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+				      unsigned int freq, int dir)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	priv->mclk_rate = freq;
+	dev_dbg(priv->dev, "mclk is set to %u\n", freq);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_adc_dai_ops = {
+	.hw_params = cv1800b_adc_hw_params,
+	.set_sysclk = cv1800b_adc_dai_set_sysclk,
+	.trigger = cv1800b_adc_dai_trigger,
+};
+
+static struct snd_soc_dai_driver cv1800b_adc_dai = {
+	.name = "adc-hifi",
+	.capture = { .stream_name = "ADC Capture",
+		     .channels_min = 1,
+		     .channels_max = 2,
+		     .rates = SNDRV_PCM_RATE_48000,
+		     .formats = SNDRV_PCM_FMTBIT_S16_LE },
+	.ops = &cv1800b_adc_dai_ops,
+};
+
+static int cv1800b_adc_volume_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cv1800b_priv *priv = snd_soc_component_get_drvdata(component);
+	u32 ana0 = readl(priv->regs + CV1800B_RXADC_ANA0);
+
+	unsigned int left = cv1800b_adc_calc_db(ana0, false);
+	unsigned int right = cv1800b_adc_calc_db(ana0, true);
+
+	ucontrol->value.integer.value[0] = min(left / 2, 24U);
+	ucontrol->value.integer.value[1] = min(right / 2, 24U);
+	return 0;
+}
+
+static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cv1800b_priv *priv = snd_soc_component_get_drvdata(component);
+
+	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
+	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_RXADC_ANA0);
+	val = u32_replace_bits(val, cv1800b_gains[v_left],
+			       REG_COMB_LEFT_VOLUME);
+	val = u32_replace_bits(val, cv1800b_gains[v_right],
+			       REG_COMB_RIGHT_VOLUME);
+	writel(val, priv->regs + CV1800B_RXADC_ANA0);
+
+	return 0;
+}
+
+static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
+
+static const struct snd_kcontrol_new cv1800b_adc_controls[] = {
+	SOC_DOUBLE_EXT_TLV("Internal I2S Capture Volume", SND_SOC_NOPM, 0, 16, 24, false,
+			   cv1800b_adc_volume_get, cv1800b_adc_volume_set,
+			   cv1800b_volume_tlv),
+};
+
+static const struct snd_soc_component_driver cv1800b_adc_component = {
+	.name = "cv1800b-adc-codec",
+	.controls = cv1800b_adc_controls,
+	.num_controls = ARRAY_SIZE(cv1800b_adc_controls),
+};
+
+static int cv1800b_adc_probe(struct platform_device *pdev)
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
+					       &cv1800b_adc_component,
+					       &cv1800b_adc_dai, 1);
+}
+
+static const struct of_device_id cv1800b_adc_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-sound-adc" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, cv1800b_adc_of_match);
+
+static struct platform_driver cv1800b_adc_driver = {
+	.probe = cv1800b_adc_probe,
+	.driver = {
+		.name = "cv1800b-sound-adc",
+		.of_match_table = cv1800b_adc_of_match,
+	},
+};
+
+module_platform_driver(cv1800b_adc_driver);
+
+MODULE_DESCRIPTION("ADC codec for CV1800B");
+MODULE_AUTHOR("Anton D. Stavinskii <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

