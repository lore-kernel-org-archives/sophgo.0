Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086331A059
	for <sophgo@lists.linux.dev>; Fri,  7 Nov 2025 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511419; cv=none; b=jzcAJMG8i4SzPNvMbQPgeQh+tGKp3T4/KovvWwHzEpD4LOIYjXC10UAbJDQEZFK1fUdqgdY7l26hC5BMIwePWDDxGZQOyOT1gaY3YkK4vmjgB9SvpeS6zLcxDuvF50f+YSMM6UjEkFuvaqORHt3Nhnk4QPQrefrkTqBY9dfW9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511419; c=relaxed/simple;
	bh=yY8w0En7ifAOHnUc2TsFrwM8BU5vXAiE+eQSw5KxyCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhCUuGoVI4SMyPZ9w6wgbiS8dcfaYiUYmJnqT4C8UFCgqcK4Yx0jAmd7/cwypoo29x2+ko2dYgfW7Ez35kEDm5rtqz1XSfSeFSHDJV4RQdqW5PhntxpA05gjJuzvBa65DGnvBzBZETzMqbG7GomLELjqPPsUGGeVBYpNKu4Tw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hpo3mcar; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hpo3mcar"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c8632fcbso385340f8f.1
        for <sophgo@lists.linux.dev>; Fri, 07 Nov 2025 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511412; x=1763116212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=hpo3mcarWAmDUPKblOzR4/cMzWYYyKZumB9qA+kIDmx13TACZcqCXACeCYkSkstU9J
         mB47c32IrTkhU41Dve4OdgSnjWrt0koHNeB5LBNsm1jnR0euKMHBCpdBzOHKhRLAx5Wm
         AjBf58Nj2H8idy2Jq8466ZgBLV2PNwGkgbTWGEvTuxsNVE+1koqcV1/3zBd0L2qHL3v7
         h+pUgXIC11bnLUSXht4YIS0Knr6kMx3HQ080nHjWrb+m1bnn/DSeUfrfiKOwaov9mNuu
         1oDk79sVMWq0ifwLAw43nksRtW/xUNiTisV1n8jnDO6wKkjgMcdVne5AHVdYjhLM7ff7
         Kyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511412; x=1763116212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=QXjpTVgo0VJRDbpBNYVBRhlNy8k+c964TRTYc0re/6TG4kingDu+pMQeibbEUlGlfs
         uQICJ+d3HDfqyW+24TRY8atnf11yPASR/iE5+wJpW9/+T1tTRNwSB9S3n6DazsSCPMtN
         KeVZRJFwfRqlBj8ytY7ZX5vcZCbSWfCmyhhu9aoAJUEGID5E7zNeIsN4Xe5y6LZXcgIN
         9kw6SgVzU3xS2hs7OGpd72ZG9V4Mg1w4QdqMth521fCWww4ULKvCtydSXGax4bCpjl81
         b+JTU40GKKwdN62VaMZzsPEM4+iiLzw4v1yh+kO1UDaOHH5tJCxGSsyOTXhfYXsuR/rQ
         pbew==
X-Forwarded-Encrypted: i=1; AJvYcCUFr2O/dlZaYOTpTu0nbz3ykhwgDO4HeWQTZCfRVxHLuak6w5O9PU0/siwglBa3GqS9sKlEWEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmZCmPYAmIgjkqCyWBi2PVB7Qdrw8G2WndGoEaaEkpu7RTp3U+
	1XN6fdGg91PBMehobbDg580nr05j0pVpOWCAyc/fB9ET8ass8C+zms4dN7+NTl97yFg=
X-Gm-Gg: ASbGnctrGE5RswrNeRb/vVeEmHzNrODKezoWpUJ60T2YXWXiOf46sPMTG3SmI0I/6bJ
	iZq9GVKJ1CGgtw3cE2Z20+xMRCCRqmCn+6ZFlb6306x4qonGvnaEr3NvARZzeMgODeFTS7Stilf
	Dsw4QAZj8Eoxy6eCl/un3pjwfbWxoI9elUzySru+Htgo3T/Ngxa1NyCWu8RiAwJJ0Zdg5S32FQy
	BxLgbUGyZmbpuWBoycEeX7G7uYonu9feAsLK76JYAEPv1u5/K1L1ELkT1wnB1Rs+ryrQKvLNEd9
	YXGmoIHcK3d28TT2HcBasQmZAQVDs/LxXZvo/vmfrMgiR+Bt5B9mZ9q3CgPUS8N+vwb8nQ5Elor
	eSobCPGIA0hsEPm60ZQ9ZmxOMGpgNXrBm2SDVkj19oV2fz9gTdPswZoGXUE+9UmmE4eJuknv4k8
	CGAsY=
X-Google-Smtp-Source: AGHT+IERkMxY/OdgqWfaZ7AT7DwdB4UOki9h9A7muZP3Z616/ajyEOm8UxRI695/XTN9HnuI+cZyWg==
X-Received: by 2002:a05:6000:2012:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42aefb43605mr2064791f8f.47.1762511412542;
        Fri, 07 Nov 2025 02:30:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:53 +0100
Subject: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/4v1a8QAtlU1YFnwlRQMWe0GMJqjCY4EA0FHsr43o1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDconjyIV+fTbtiiEvLmwzz2XANDPioDzvoKtm
 cu4MX5qD8GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 chguD/48PDKdlDmcnZzg7JiW0mzCIguyJgTHeZLzPIFm5p89jeT2Xw9rJg2JOadHllTnAvDXe/U
 rvDQsGndzvsN+xzFpJ61PEzm5YAScMgZDW64C34/Cog5rNgiNs3vkk1gLmgscNeF3Cna5YA+RA5
 BsXoQWCIq5UtEFkXesDvEfFmouRUOeTDINymGLKpCE65eO7kIWIQCZpYBDo6AnW06NlTq2DlOKQ
 Fdp3E4YMrkhab74JdTcn39x/INJvXk9K5y23XTeiGCMlvPmiqtmboUlQPDXdOIU3C8lUqWRkUTT
 7xxipK88IcZ8YiSyegvj+0NLjo7dDc8AMkfyOkibQMiUh/K2t0tz7bIjKXZlNxdWPVJhkqswNyW
 R0evKvs6IKV+2Q71flHCD3rcRH0yK0gW7fA59gChceGBjLKGchAkERDHwwqrOpUqNy0WePVlsn8
 rAUWS+/a13WqCZG7ZoL926vFHV/gx8tYhJhWbKsM+aXcbTkr7WgNPhL6O6LPGZg6LIPL3+052yp
 Eld9SE0yD3WZLc0ux9XwhoD9yRGy+e1dAMCzD8+Ghg/k5pxeRe7x5u5SfcOx2RTT0x4yr6yuL5d
 fGW0aKXSXdHWQw7ECZ/W67Bn6p5RJUhQVVzQNg5VS3/UwDyQK9uldBujAYSXuMLCQV77tfpiZfF
 FazfeeIRG8/+w/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.51.0

