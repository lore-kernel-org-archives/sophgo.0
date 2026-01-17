Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED261DB13A
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681168; cv=none; b=fywtNa9Dd2L9YEoOexfK3PRbiu8UNokVEnhvKksl+QWav6t/v3SiumUXlb8gxmXM1UWN/NukX5znQkDbST3AjGeXzA20WGeXY/4guoCBt3xTX9RpMYV4MUpXhe3KGQcoq0qY2ntymvkYPuyEKeMI33Q70f7Yfg5wT+gfqtFTAUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681168; c=relaxed/simple;
	bh=RuCJDqbjt4/1OjYPNQx7uliq1cjVd/YITyDYhrLPVMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RV6cTdpLiGiodjMSRNN82n7paeavHPqkBjX2Wm54BcxmCNNO4u6wqBA2Ie7ic9vayPrzTu3VAUSzE0C8kMf7EQxOTDnWpCvIlvpQkNZO3tYe8H1g+eNbVtRHjIUY4kCjr9PDckAeOpnEF1qzOPgDt50p6+9Z32XBTBcuov1KJvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2qw9+nW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2qw9+nW"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so35723335e9.0
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681164; x=1769285964; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuMp3/hIeMrlP0ISwR7NIwGJWIBA2lBFXolUkLdtvk0=;
        b=A2qw9+nWpsn73V2oAKk0mvXvGhpSUYwWnvivneBztCB3Of22EuQ4HYviY8dK8f/kCD
         su1FmY0qQMTIMtuuV+FBZTO5oAXl2zlhZOOHlga44QQz+vMqsHSbUZviWEz/eaWPY0ro
         3nqECmJUylKC2clCtKwFHXoAg61sKymCAgYpmvuVdGkRv+aqs3EQLQ4e2myUq9IlARtg
         HF5iKPy0rp/5S3tND0iTup0p1/5MPYjqy7CmNeiPoxXfB6j2oB1lpziL7bQwJOgopKOI
         Yktm9y19QLCzf/1M6P6ICkedVwqkEMxsW1GY58l5UlMJwZAK4cfuaZ9xgaHWU7r6VBLs
         NqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681164; x=1769285964;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuMp3/hIeMrlP0ISwR7NIwGJWIBA2lBFXolUkLdtvk0=;
        b=gBbCLQ8qlXbFVsDuaopElf/Crmv9Ckm+dsXejS6w4zY9VrMG2LFXQZdoXmSeSKLut+
         94+ayiiBcm15MLFw1osAAFpu9sd+Hxw5MWxX7ylZBHQ/2TDX+AWwtfkbJuUeyTb8TP4h
         5Mi8XCPEKtvtdiBXMKkf0LhZHMmssYnjZF9Wzw4g4hj0VcQU9KmV6G1JIaT+Bbp51Gj3
         qnWgXJMbb1BKUcq4Z0mJ/SSxsjsqvdb/TKsPmhqa+1NdvsIadvn0u2sm/khbute6dviI
         oIioh47iVq/zeglFSFkIk7QLRsbFVlSpMQrN6SvpzyeZMBdIoqCeYaT01G53Ut9WyQTP
         G5lg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RUpteE8yGPquQ0i89Rds3vp3nlUhwUr5V2aKaO1kxcsu1HXbuwCiXUmIvMuvPm+OxuiYYEc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL9Bh75PME2hQGsKnisRFKK325iBUfH3P3xSWLPONUIFWIQZIt
	LscC1U1F/2kRfA7krpWBhBPVKnmLoOsy+1Fuuyo+dmw+qQZmBe1rXpWX
X-Gm-Gg: AY/fxX7PkiHv/AvAg+wQNZvqM9wkUkrl5e3pezvg6PxTeRm1ULo6aagFElx5dyMNnu8
	0uKMZnil1Vg2T5mIvvX14fWzf3Gba2XBXxl4PRU1syCI3WLcIvRKGbZtE1SvB3WpW3Ac82DIrOx
	BVkwFTVhm32IMVqM9QzCy3Uvc31zHr0FWIFM1fSajQ0xYM41EIv+MmpTsTErSaAo+ua8Rz8D/ys
	gPPpnoplV4cZ7f7+T0cam9CXIJJK/uC+jhNFYrOHYO2wQiwGgYbawhf14NqS/O6iLHlMLeROS1r
	EbpKpVq4k/gDXEiaUaCZLOuhq5JSQFAHJmJv7eDvgv/yZ7pptS4SuNA/sj24OVBkX18n8em7uMD
	N4UG3s1cdGQb6BqZMf9dfTRw3+jFEdLmWm1jFdcjJur/Uh7/vzYvqrsg5ova9ulGOxVQHM5Frzs
	WBDunpX/rdFwH2of6M0gqc1FZO3iIFGOAwodLziVkVvunY
X-Received: by 2002:a05:600c:6612:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-4801e3530b7mr88935485e9.35.1768681163751;
        Sat, 17 Jan 2026 12:19:23 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:23 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v2 0/7] ASoC: sophgo: add CV1800 I2S controllers support
Date: Sun, 18 Jan 2026 00:18:52 +0400
Message-Id: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzua2kC/32NTQ6CMBBGr0Jm7Zi2SmlceQ/Doj8DTCKUtKbRE
 O5u5QAu30u+922QKTFluDUbJCqcOS4V1KkBP9llJORQGZRQWkjZoi/SCOGQVcaQuFDC6yA7c9G
 BfKuhDtdEA7+P6KOvPHF+xfQ5Por82b+5IlEgGaeUM21nrLuPs+Xn2ccZ+n3fvw8+qGa0AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=3154;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=RuCJDqbjt4/1OjYPNQx7uliq1cjVd/YITyDYhrLPVMg=;
 b=1sf6uqdI6XFVuR4O9E1Fi/GEDfhDfMyI4KYTNmqVXwV9EUQcZwt+LnKRH31/TxkYLA+qjYA1p
 9fVzB584N/fAAsluT+aHjZKfHFVVdKwhjHXHDQuufchXrgVWf62VfYx
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
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
Due to SoC design constraints, the output path becomes functional only after
additional vendor-specific register programming.
This series makes the limitation explicit and does not attempt to work around
it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v2:
- Updated cover letter.
- codec nodes moved to cv1800x.dtsi with status=disabled
- the commit with dts example for 256M board was removed
- added details in commit messages

- Link to v1: https://lore.kernel.org/r/20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com

---
Anton D. Stavinskii (7):
      dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      dt-bindings: sound: sophgo: add CV1800B internal ADC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      dt-bindings: sound: sophgo: add CV1800B internal DAC codec
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  63 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  41 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
 12 files changed, 1569 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

