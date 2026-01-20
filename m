Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222346AEE2
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935975; cv=none; b=pKNhg+koqtkHRCXcca8ZV1S6qvE8Q6TDUEh+Cr60JS2Mr3pHRu08YiyIivWe3x8jUlcS4PCmzTHYgQd2NFHTO3/hUWzkZBIs2hV1w5lFX4MhYPrTbBDu22Qk/Wwfe4+ccUG/cyiS9Cd+oKRf3uT8HLMBy+qtEw8txkqLXv04IP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935975; c=relaxed/simple;
	bh=/i53vqMAIdZNSQKjWuPjGV+34T+Veokykl4U0XdsoqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMPxs4KLEg9tMyF4vor5nRe2J76U0Z8kJerDpoJW3INyvVUtBJyAcols3MEitoHnUCAVpLCvaO+fVFtCzvBRaXyNY7ct5nkHH+FK30PuRv+Dpf5SI1BNgZTu7kA/e0+66SOm0QWIctjBabkC/WkmSogDwxzI4XdHXfjMb9J/xJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+oe7FzK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+oe7FzK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so46141715e9.1
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 11:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935970; x=1769540770; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=S+oe7FzK0qnkK66e9wR5fB32BoBnNgCYJMCvX8CYNu8pMNezuusOGa8SD8U1uyBHFH
         fdF7ZL+2x/CxMLHv5bAf3IZemSzDXrNbph/d4qEY3GKZeKzs7/lN9gB93/QFGni5My/B
         C9ln0+thuW57EvponOD+cRIW4CcYNY1JAGb8F1M1KlB+iG4IzPzZU/sftBpKeO8uG69E
         qoPt8DFOA8FkgI4NE/xR4kIy+25ckamAviLd+py0A2WX7nIk1ZjMeJ962L5oW8g4lfAp
         ubCF7O66ApXkYS3aRoJPOVjWUmBBB/R67yfkip/MtQD7RNRkjaFUWWnypfmp0sHdTq39
         natw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935970; x=1769540770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=jYRqvx1Bf5cNUlr4hdpcnzqwYNATy1WiVgvUKZZq/NVZJ5Yn+JyJTRL6uF4EljlqD0
         JXR8g7PAoDpx2AjkRouh6NFGHAV2YHV6QOGpzUVgei53waD3wwvEGjdPHF8z8f2iJT/I
         Hol1C7Ec9lpWjpRTE/HZlAyUyUkq79B5tlyNMvRo69/zgXg/4JeLJ2jDNNqt3e5sfZyv
         VRF0i2v47cZKLFNKJhp2HYpIq/l4Pm6R3kvvCS3l7+DnIHz9DSwAIOQennBMzl02yPNJ
         LRYVj2WFY7mLq4fsGXMVyVkDxlGo5b4fAtOZEVtEbPNTIiajPDruXNoxauDvUqXKIsvd
         2Lhw==
X-Forwarded-Encrypted: i=1; AJvYcCVvF3Tzv9aTfdpePg/8wC2mBHgMhf3jPbL6OxKgcL0NqI2BUdO7vMmpdMEjyd2hFkcBkgoGlpE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyX7gFLkuZilyYMBPufYX1y2lt6gRSDr+1Qbtm+IPsKST2nnGkN
	/052ILxSLZRtKed3vioFuM7e6A9gXZE/WXQkYpaWTo2EbrkR0gu7zodh
X-Gm-Gg: AY/fxX5asnnHe7VmmzxE0AoBQ3PAtqDUVNp701qr9/Fs1mr5ZnqbK5BS5kNuvc0R/SC
	oBn2GtCUmnXzvhZeuA+Uq5nblUh8v24E+mrsStqKd5GBkANwJQK1O6uYuZwY7ba/vlhWT9iiR+9
	0urzmmlC5OiYYgaljOmfMlmHkRTnQDn7ndZe5JDB5QnUnkOd6/HbWuA+scTkGLA7bnNUozHLJrL
	zYqmDlHPNgnYU7RaSGVnMBNvICSdJ4us6OQ+yzEg2pmeN3+p7rYLOgoBfm9Cc28vyCzd8fbps30
	7kL9zfG42S0Q8r7z5cWrjM1XaAKvAS/hXTxJu2mucSPuYsJk5UvlPAKI2XYYcX21YkCssRgSSyo
	ceDSzt1GnOW2x2D3Yy5Z+IH9mT9OAY3LzFKCyLQMUM/mRzGBbuIT6IwtfGpehiVq+lgv+rXHfqf
	yX67i5zck4DM77lBgW6QRP9L8tvYHLFAb6EGDseWFmHbSA
X-Received: by 2002:a05:600c:3b90:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-4803e7f184amr42521595e9.25.1768935969900;
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Tue, 20 Jan 2026 23:06:02 +0400
Message-Id: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvSb2kC/33OwQ6CMAyA4VchOzvTDjamJ9/DeGBsgyYiZjOLh
 vDuDk7EEI9/k37txKIL5CI7FxMLLlGk8ZGjOhSs7ZtH5zjZ3EyAUIAoeZtQAxhOInIbKLnAK4+
 1LpV1rVQsLz6D8/Re0estd0/xNYbPeiPhMv3LJeTAnTZCGC1r3ZhLNzR0P7bjwBYuiS2hdwmRC
 YsAUnqVX9O/RLklTrtEmQmoAJSvENHWW2Ke5y/oNJfUOgEAAA==
X-Change-ID: 20260115-cv1800b-i2s-driver-4f17836dec56
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=3943;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=/i53vqMAIdZNSQKjWuPjGV+34T+Veokykl4U0XdsoqE=;
 b=ujF7DVpfDFcIqiJ+hFjkIaX7+EUYOaYF0ozWAVYPkNGd1jyRyVhNuGdrz0jshI7mm1Kg9d0Qb
 sJKZFL2jBg6DCRGo2djEfdHrar5RiLYCQUyiZ/fUOmy3va0Uf+jz6cn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

This patch series adds basic audio support for Sophgo CV1800B,
as used on boards such as the Milk-V Duo.
The series introduces the I2S controller driver,
the DAC and ADC codec drivers, corresponding DT bindings,
and DTS updates to wire the components together.

The implementation is based on vendor documentation
and testing on real hardware.  This series relies on
recent fixes in the DesignWare AXI DMA support;
in particular, correct operation depends on
the DMA changes discussed at:
https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
The current driver implementation supports a fixed audio configuration
of 48 kHz sample rate and only I2S protocol which is used in codecs.
The series has been tested on the Milk-V Duo 256M board using
the Sophgo SG2002 SoC. The implementation is expected to also work on
Milk-V Duo and Milk-V Module boards based on the SG2000 SoC,
as the audio and DMA blocks are closely related.

Known hardware limitation:
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via 
pinctrl alone.  Due to SoC design constraints, the output path becomes 
functional only after additional vendor-specific register programming.
This series makes the limitation explicit and does not attempt 
to work around it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v4:
- fix issues with i2s bindings
- rename commit for codecs bindings
- make single bindings file for both adc and dac 
- Link to v3: https://lore.kernel.org/r/20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com

Changes in v3:
- Kconfig: add SPDX.
- sound/soc/sophgo/cv1800b-tdm.c: add const to cv1800b_i2s_dai_template
- sound/soc/sophgo/cv1800b-tdm.c: drop unneeded debug message 
- sophgo,cv1800b-i2s.yaml: removed address-cells
- sophgo,cv1800b-i2s.yaml: reword for commit message and header
- sophgo,cv1800b-i2s.yaml: fixed dma-names node
- sophgo,cv1800b-i2s.yaml: clocks min-items fixed 
- codecs bindings: squash
- codecs bindings: unevaluatedProperties: false, dropped redundant
  description 
- fixed build error revealed by test_bot 
- cv180x.dtsi: removed address-cells in i2s nodes
- Link to v2: https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com

Changes in v2:
- Updated cover letter.
- codec nodes moved to cv1800x.dtsi with status=disabled
- the commit with dts example for 256M board was removed
- added details in commit messages

- Link to v1: https://lore.kernel.org/r/20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com

---
Anton D. Stavinskii (6):
      ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-codecs.yaml      |  46 ++
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 11 files changed, 1520 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

