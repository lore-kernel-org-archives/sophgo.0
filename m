Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4051F542A
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425385; cv=none; b=YK3DFPiYwO5blst5b9hQyrKVReB2Dp+iA/cmvHHpfWV/RNaisnjcFZDd2/x5r+vDrwvY2GU772wE2q3nJRPNGYA8dv+85RLO4uNMZjvOeATemec6K6MbrF6l6hzwrskfNz+1WujJfyv3FfqWfFcQh7XTtc3geegLGQvRmDfA/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425385; c=relaxed/simple;
	bh=afKw2RLAsHkx4z7Ink9JdbmTDsPPLL5SsmxRARZhi4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SM0dTulxK/YCogDtbpgwKea23/DahWD+wubIOt3WQgE96OEj2ykdByWdlJOoAY/CuyynUJL5Hrs0ZEB//bIUUDRrjLdSm+4UULFntGIgjTbaHaLrbuQCWbGL1vTZNgbsv6FTA/XEEgXcaa3oR+rixNCIDwgHkgOAnnfkp1nvaUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR8TuYGb; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR8TuYGb"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6faf66905baso59844526d6.2
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425382; x=1750030182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SU8RawjSZdNZIx5mCZErc6Hx9E5djpvdZZjZt5itdtY=;
        b=kR8TuYGbPlYjUljBojHwNSGlsjp3RV9M7SGIK2rT273M6N+8PxBkexXO4HYF/Vcffi
         kux81pZ2TprJdFk6le4I+WOxYxb9mJ3C2eRjDhSvgQk3Y2NOWnXGIVgmxwvgAlJWvwez
         63pJuFXC1dm5e4PNFACNi/xihqWA5vg63CLqx4+bidD+L7roWapWmq/qPPfaGmqU0Io/
         lA9b2S/vAK8t7eq6zdsaztGJlyl/wVoIYib6sbGpKOg4GPaqt/8Jia/WcBdwZRpRQmDX
         gaJR8y1Qh0XRtuKnw6KyEDJMoYk8IqeMnrn8BlASi/4mdAVGydkR2WNWcmqwbFABMdoR
         2RgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425382; x=1750030182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU8RawjSZdNZIx5mCZErc6Hx9E5djpvdZZjZt5itdtY=;
        b=rsE7mO99Yf+WdJSRzm2vlf2xDsrkRnL0aLLK2XTqjOkigI8mcgQZKxJSq8k43VHMLt
         Aygw29XKCOv0Yfc0Tlhck2rUDTKoQF/N4d90L6gD3sPSJ6+nt9FoB4hAGywXqY1kwoF4
         dc+/ck20ufswtetNhV/VwBguQJszq+BXWfHLgfb81DY7ZNb+bFymM52M2vjeiz4MhIE/
         FaOFlgftt66u0fVK8A4IM67Cqh1fnWPjSQyw3mmr6pQzCF79hZAIQ0qqBOXvb4/RIePs
         pOr8Yd82mLmosRaG6mgNxGSiM1UZ3J5sFPi512pOa8rcDK0JxBz2+nICUyDWXXNrd6R9
         vEbA==
X-Forwarded-Encrypted: i=1; AJvYcCVslmEMznFqb41U1NtbPic21jGaFwWE8xnPxMXE1HDFtZrxZHagZqDKDbnRrtgR533Xsryh5wg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyME9YR+hk3YRJzBcBH/jOZNQhp1gKodqp1TEfkBFQOaYMZ9pt8
	GJ4AsfKyp8hyl+DNS1wWx1rrN2sLdBM/BlRGQosZeKeiD/fNdmzEEJZu
X-Gm-Gg: ASbGnctO1oXOvk1sSWwj3DXWRkhm9qxCYQkNYjBXa9oPuXwBNf50rmZjY7G+dv+PGhR
	s3f0Adtmv3Jk6ccYp1bDiiQwEQWMdkvctWe3a++gENiFsoeUZ8ZlcrRxrjM9B81GaWfPxFKPlId
	LfDZ4jL4a3wwlWZomhxDz+sxlPV8vZnNDC9BbNzNfoPFmjIbfqOjPRXwSWFP5iigwbLFgJmfdtY
	3AgpoT22aj58eFEjd7T2MZlHipmIgroqWIbwMH9tc01Bi58S0bb2urHiifMzEvjUPPkTU6QPLKV
	BEJw53SuczGz7HUPo7ho41bwZtF6knr2hg8/ag==
X-Google-Smtp-Source: AGHT+IGptkGsilp0rjRsjr4k4/JNTYB2bLGg6xQxJeSBP2iNfrPSLopfC8ZXQso4Bk3xGJqa+Kzo+A==
X-Received: by 2002:ad4:5ded:0:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-6fb08ff86f4mr198607016d6.27.1749425382538;
        Sun, 08 Jun 2025 16:29:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac85a8sm43748866d6.35.2025.06.08.16.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 00/11] riscv: sophgo: sg2044: add DTS support for all available devices
Date: Mon,  9 Jun 2025 07:28:24 +0800
Message-ID: <20250608232836.784737-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the clock driver for SG2044 got merged, it is possible to add
dts node for all support devices of SG2044.

Inochi Amaoto (9):
  riscv: dts: sophgo: sg2044: Add system controller device
  riscv: dts: sophgo: sg2044: Add clock controller device
  riscv: dts: sophgo: sg2044: Add GPIO device
  riscv: dts: sophgo: sg2044: Add I2C device
  riscv: dts: sophgo: sg2044: add DMA controller device
  riscv: dts: sophgo: sg2044: Add MMC controller device
  riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
  riscv: dts: sophgo: sg2044: Add ethernet control device
  riscv: dts: sophgo: sg2044: Add pinctrl device

Longbin Li (2):
  riscv: dts: sophgo: add SG2044 SPI NOR controller driver
  riscv: dts: sophgo: add pwm controller for SG2044

 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  48 +++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 313 ++++++++++++++++++
 2 files changed, 361 insertions(+)

--
2.49.0

