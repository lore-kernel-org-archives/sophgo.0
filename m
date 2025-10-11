Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC24C81
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147315; cv=none; b=Fgk/8D6o9vQl3w8XpY9+EhF2wSnBUJPh2/2rMLeLgZ51KMe+Oa+aV7xZKCNf3jVxwKZs1TfwOW+8D2NoabqSO+7c0ZxB1AyFulqzVIwpQ68m+h09koei60QY+EfsjTMBS+9gqf+CRf5Bw8j5rHrlNUryUS5FW6k1JQXaOfKuQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147315; c=relaxed/simple;
	bh=sHjX7E/+ZZPtjLeTkqhQZWbJPxrtcGPQ2098JqzoOO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rL4Ru6ZZSG2+XRoyOkUKd5D279t9IAPP3b0FBx293QmCaoglgE13XbZGqJjyXlsfJftAZ07Zu/NIiqM7D18nVfcNDoym8HQeHBIgX5ah2MgFpnIMCUcvuSkGxr34pLaZ+yjXLnAHu5QbZgexWLXZghv7h1txBtLc5F6AH0+6Esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ+oYjS4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ+oYjS4"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so37211536d6.1
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147313; x=1760752113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/W2Xx3VDAhi2ly1ngkxo8tYf8fz/VcaD9wHZnrx7SU=;
        b=dZ+oYjS4waZJ0tSs3aApTQwkUmBWRkjC2a8+WunyZJ7er8jxI7O3vAOAwb++vimuO3
         ZngHFjhLqeWAT2kOnAEqkKMul/Tp4nGomyuV5CvLSk1irbm/0xr+ZLtuF1b9XlDevUWL
         jgq9sOuwsdu7rDM6lhvgk5hV1vz4xu9K6VXmO6Jqj0z+FFnH8ttZt0e4qSWiUjXrAWPN
         uDaZPtGPG3PpxpSANJMN6Ycoz/o+BT5yPIGEnVc7Aum3mNs+moW8gNF9jVRrd0I8wjBk
         riwq1hPKMUjmOGAsLTOFyFFwlvEMm2CE+rAxNM/KfhPdDD79Ign8mt/RBOXdJ2y3o0aE
         curg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147313; x=1760752113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/W2Xx3VDAhi2ly1ngkxo8tYf8fz/VcaD9wHZnrx7SU=;
        b=l+ieG7oZe5h/UsR8O5S6PxAJAlu2dgHcqrpXynuGbHkxTeiywyvUPb6RhElCMjCJkd
         p0ZIeEGoBHBMPldZ/d+QFczqdYOPSZAxwU0qQonL7ZrMimkTybn2vEq+4xhFdfpUU6yn
         Rvn91WBSZSGIpvSINMGOJVK+crAm3240ID0evz6zBF4fsqq4CPBEF8KcyxcLMZnFKj4G
         dzcuVwtfoTuj0gvMee8HLvo5sUVSfmgQm81e08DtlKq0ti+PbvOcTpk1G5gbTAUmkytT
         qr3iVzx/78Gk0xXMifsZ0aF2UoB+TOOKnfbAAA52D3fbA/q21P1B39Pje9FIA75ITRTs
         GUgw==
X-Forwarded-Encrypted: i=1; AJvYcCWfvgwHlm0AoiKuW10ll3BJPl12yj0I6+S24lzRSpZNoDrpW45b7KQljm4DO1to+ZegV9AxNPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxft4b4Nt99iUtLJPbat7npPS1bVC2Rdzvd4tZ/OUa3RnFUE4UA
	hxjE6rnUo/Im3hxVcjHxWUpi72FWS0USNqre7Xpw5PdqDosd/VgFlhjP
X-Gm-Gg: ASbGncuw0JerOKsg33ScQ7aDN4enXgNTqcWpSjFL2xRY1g5z7+8GWMvX5dXYvFfGhuJ
	XvLcd1dCXm+Dz4wopt2q7M7v3yDqHV3xgO6mEUrmv5RhBBsK8S1evMqea0Pz3TWC3sktULFppjS
	gJBDM/N142jGZ86rVrM2hSwLwnIZ98xZQTcRcLUwAKdHhLg+8jNh94jyWS1EcRofb0ZBpCF+tWO
	KNW2ZvmJu0wl5vuUDQtd/Mt3UK7tvhDUsSbGmdeNxMslRJxHonoEownGAt07tYXIziwQfiNZc/M
	QZ2S8o50p8yhTiKuIp4bp0vVgEce+sg4nP+zJSVhckaZqCpsEPzj+HUolJlkv3VCuKLVmJNjj+9
	PM5ErlQRbxoYsW1k1TWK2mddaTYw3HhUKEobqP0RTbRrb7i1msN7m59Wj36XkeuK+T5Q5CMuPZX
	MVVN+9ePObyQ==
X-Google-Smtp-Source: AGHT+IFBkBNnpT/JUcUbYt+Zy+CvYduIlQhXQKlUiQpAEV8m4hje8Yu33lh54bsqnR3UkiS8jt5MJg==
X-Received: by 2002:a05:6214:2485:b0:792:61c0:beb0 with SMTP id 6a1803df08f44-87b2ef71746mr206771416d6.67.1760147313167;
        Fri, 10 Oct 2025 18:48:33 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:32 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] Add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:08 -0400
Message-ID: <20251011014811.28521-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with both ARM64 and RISCV64.

---

v2
- Made new entry in docs to avoid DTC check error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout [2]
  and available in the device tree includes
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works
  without
- Added riscv device tree

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
Link: https://milkv.io/duo-s/duos-pinout.webp [2]

Joshua Milas (3):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../bindings/soc/sophgo/sophgo.yaml           |   5 +
 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
 5 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts


base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e
-- 
2.51.0

