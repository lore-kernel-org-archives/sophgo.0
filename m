Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D63B8D69
	for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840250; cv=none; b=VAc/oSbkfcUWz0leqypAB6Dm5LReOwL4VaTJ9RXgm+caZGEYBy7CfagMphfy0h30+VWELjLw9UqY+OwynGxrzvvoFhw28u0MZ1RRNz+Xsz6Lrh6DyRj0J9vTbhSbesYOLsMjOUSoIBP9kIeb0hVLoUNA/9Fdx8U1soIsqAvJr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840250; c=relaxed/simple;
	bh=tBbE5TYMjz9mJOg2pvzbDmpHsdxVsvsn/pV6RG/8C5s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AVLNIRp/iDLj13Vv6mJNc9WBcY8UEL7N1I6S2nTgms6w1zjr2Ov/p2oi5dUSE0mmX3DlnazPX1xleknlkKHd6rbko1Mx+d/WoNPoR3nnhnUFSn4/4qkCRj4pPH+V028Q4mlmhkbHtdPpWRmZ4NOoaNPgPFUXkC/88ynrfFYRD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky7bOEt7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky7bOEt7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc328easo36554855e9.3
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 08:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840247; x=1769445047; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=Ky7bOEt7up9bu4zvJC+hAEm0zmXMDpDQfJx/zCdCwnQsvFdoIsYMYkOZ/yvvP0Zb30
         /TYcmsspg/EizxnebzupTur8cdO80kk3IAxQvWZbw+6bexaZsaD2arbtaJ2EHuzZNqRs
         x3o4ebRCBFmeUrhG6ZrJNKkaKZeI3BVIZM9Ak2CgSkQe0LBklIqO21S6dlz1PtKVIBgQ
         0W/OU3k8eoUxkYhbfigcESbBvsR4RoqftgelMXWIVFUJQ4MuxPN13mWu/+Dyul4QBGla
         OMnOCYr7lrBRBaFMRS0l2s8/uP4OlFEC2sRTbgsI++riMW6y0F7dy4ywu1OwB0QJMSB7
         rb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840247; x=1769445047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=NXqZ3gKBJzyvBnb7ruvVWvZZtYf2i8zjVlObE4P5dE7QBa3LVonWxLvUVTNt9lq6NR
         +l6l5CL9fMTrSTp+OnMHU0m4WE8RHnK5q9Ze+woUUvodyHMBK+cg7XyGAxi/XMnsqcpW
         sb/WqRdqcJiCCT3QLbWGNLm0mS/CgAxfMbzOOOfgxNalG0kdEKmf7TIxwkTT6HSK1iNC
         9ZA58RxFPSxid1LX5BNjVSPxscsnaD8Uv0iapNZYQV751HJPjSlJfz4CjPUUiudW8CSP
         tiki3v37+PfDuX+0LPt8YVXEWg0vXHhcgsIZQ3DtETsPHgH0yZxHnfEzccA41qAyHI+o
         1TVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBnNWGOSGrbzz5fQIcur1cHxvm0xpYlafdylwNnROjdxFP2KNQrY3w3XriisdO7WmbNZQaBoQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz36XRwbdFs9kigK8yQW0qsRTKiNo6prdOWBE1ueK8A6yqgiTjX
	kQCaLw8H38+gSrS2k0+AcgVKArqZJDGldFEsAkbLHnV0bvS8v0ppz9n7
X-Gm-Gg: AY/fxX77DavkOETi7oZZC8ZlkRwcV6WlwfhuVn6L1srwldPSw/EBNMnpzEIhxH94asl
	SpnzuU176cri7DFLReZbpFcdOwLS0kw7EQll6Fyz939l2rwY2qYgPkvrxhDASYnF/hI8DTKSy3V
	8bHQ7S5KDw+h6vyUrwVB3tIXtiIhNb8ElMERuzQ18f0WrioW/tWVC/vvona2bce/2QM+g/QTDZv
	hKRqF1ijKk8gi6JMRuXweKTwW1Tpn+84km6uh7QO7yC07x0pS/MY07591mD1DiQTRMoSFIYag/3
	dDd8XUCqODFWBAiVo1LOjGG6mxdShv7GK9Rlc3Vz4tPbDBFfr2rClkOBq5k5bB6T/+613YPPATT
	ipvtNy2gkZCN/UrIGoMSUl2ql5Q61eDOxge7cgFd/YepT18xe8Bd+46T9MMKJD44JFKneOGAUYf
	Owfxv6weJ3Sxqn/tKFieTe/bUxwWpYycbuMvD3uhCV/fgO
X-Received: by 2002:a05:600c:45d1:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4801eb03358mr124106305e9.23.1768840246435;
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v3 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Mon, 19 Jan 2026 20:30:41 +0400
Message-Id: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFcbmkC/33OwQ6CMAyA4VchPVuzDTcWT76H8cC2Ak1EzGYWD
 eHdHZw4GI9/k37tDIkiU4JzNUOkzImnR4n6UIEf2kdPyKE0KKGMkFKjz9IK4ZBVwhA5U8RTJxt
 bm0BeGyiLz0gdvzf0eis9cHpN8bPdyHKd/uWyRIFknVLO6sa27tKPLd+Pfhph5bLaE/YnoQoRp
 BBad6a8ZvfEsixfTkjD0/cAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3774;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=tBbE5TYMjz9mJOg2pvzbDmpHsdxVsvsn/pV6RG/8C5s=;
 b=c7AvbXcGS/K0MvQfsJ0WarJIF9MHxYCqS987eHude15MFk9VyB7dvqMcJ62U/gdDyr2v5fdPj
 9cMqyVReILEAWoLVhniDDo5ozEq/st1lncODwK4F0UyH6XhPKHsV2km
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
      dt-bindings: codecs: sophgo,cv1800b: codecs: add ADC/DAC
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 12 files changed, 1560 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

