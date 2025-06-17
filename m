Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004423B63D
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 05:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136926; cv=none; b=N9PPbvrfNSEQLTIETUHGyxzcwKgW2yWxDpIZ+0LhZcYVD5uV8D158J0RiOKfOQIdl7yOgOgGOI72H34zw91BSEbQQUNjdD6blwG9AE670lWMtxCF6QscJlXZXMqU2JxyI9gS6SqnHjznsv20TTGbv6Sm4yKsQwJidJn5Ixb0Sek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136926; c=relaxed/simple;
	bh=8cWRihSV8hdi/ZTF/kts/Yi3Lmi7Mkj2nrwo2OnssFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1TJjTlCqkcYNGRhfCR89B7i+I/w5m/ddHtQPIp5M2/7VtNA+Hd13KyjeB0GEt9ZnxwnxuoDP2D1vmACSW/FayDr6FZoHX4AiEubJ3NpetukaHDoKyhtfNDvJoZtxgRUk/ELQUH6IVCNK97xdT5sBtigDzyGKRQwD8lkKcFM57s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP0eCnc9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP0eCnc9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350fc2591dso48363675ad.1
        for <sophgo@lists.linux.dev>; Mon, 16 Jun 2025 22:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750136924; x=1750741724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8a5FK3kQzpqiKJGUPwyQmhurnkoWDXPmVMG0kYx2X4=;
        b=IP0eCnc9v8nTSGWLyzzJgQAZRF40GV8+uwVUFNgKmNAu5ExUVGWNtM/XBXykztksy/
         kpyps31uOlpufw2cFfz0sjkm8KDf1NzpegWBfwcNx6HGPg6iet39q4EmvT+iACu/UOIA
         7GomcXYduDNIy5lVbefNisyIjEW/sVDXiWhyJk03o17gXJt14RlX8yxwRh5UsRvprE8d
         +ERbqygC0mlmW7/MnmIL876Tj9xGZmAUsR7CmHhbbbJQdz3YlX/9L0bAa8++LL7Q+dbI
         IPgcxVGSYPluSX0+qZNnSG2RqIeDPBh3L4wSqdxFEsftl2lIIpxVXFjVemDRpie0eN4J
         1bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136924; x=1750741724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8a5FK3kQzpqiKJGUPwyQmhurnkoWDXPmVMG0kYx2X4=;
        b=I7J1V+LmsBtcnlNiDAy/+DTmFi5rMjS3nY7UGfik3LZhfhxsxyFEINUepzfecEYlqg
         4xfbOvUC+CDl3irrNX6wfXw+gmmdK3GTsZ/eQKOW0SboP+w/jocoIEiNOJE63F+jGi1n
         uNlIkHOqrHQknr5Z5RPN6pZ407+m2K7X2XPSqXvpEqV80nTRc5ghZSHIPbhy5TFMMuP3
         ngSuoepJK0VtgqqZuuS0p5q3Mpo3mxHPWX13UoQRx2NPCFM7or46BVCay2xhuSnyriAT
         YvHATEDHSDvWv6pbUXFS4a5sYzN72O38O4AE2vyvwowhp2NPH+AXPticQR+Vy65DiMsQ
         Qn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU91yBaaHKSsf7H8kjvAyw4ER/VpG3HmFLoaKNoJCtaCf0iKxpB9X7k+xn/IlFc9onumyBf32o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAO7aw/Av116s6Pb6RD2Jvz2xHNcuSc9TwGK1sF3ZDBu9D3nWy
	XreF0rzZgQpzClIiHiOJ8quOFAV+zqVegiPEoE4/EtSjGRi62gi9X5bi
X-Gm-Gg: ASbGnctQMAwHTeHm+K6y3k/acGC3q1we1x3EtO5SDlnUQ80cSLvnZxQPJUZxfjvJhs9
	1XJpbTMBJWVV6RB6fqHG2U9qG94j4ESVSpwBaOF0vH2XzLSw33TvZjiaSvAyrrHvYcMFWfpulWU
	HZO842q0TyX3X7UIl1J/NHjPPseeJkJtcGOVBdAqb4M9GD01XxRBwdGJbe1p/upHoKI4wknLlaQ
	QZI4Gc3+0IqLMGjtTpK8M7n9iE+xcHPjw+Q0InmMAOs/ZkGDScq8TCS5zF4BCqXzYMDsMBwRrGI
	MhTGgGcUuK1lc6VvB4/tX6N4dM/5dQ62Zkm/MH3atdZiGZZP0DBEUCFfLZiR1g==
X-Google-Smtp-Source: AGHT+IEssrqaSfoOP/FGQlXeEDhOtAtWAeKGb5++EjqTQbQnP1cJDjcvN7caFzDjVdHbkmrf/+DupA==
X-Received: by 2002:a17:902:cec4:b0:231:9817:6ec1 with SMTP id d9443c01a7336-2366ae551a4mr176657755ad.17.1750136924089;
        Mon, 16 Jun 2025 22:08:44 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a4d6csm70981135ad.88.2025.06.16.22.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:08:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 00/11] riscv: sophgo: sg2044: add DTS support for all available devices
Date: Tue, 17 Jun 2025 13:07:21 +0800
Message-ID: <175013680588.1018298.5174289579188996071.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 09 Jun 2025 07:28:24 +0800, Inochi Amaoto wrote:
> As the clock driver for SG2044 got merged, it is possible to add
> dts node for all support devices of SG2044.
> 
> Inochi Amaoto (9):
>   riscv: dts: sophgo: sg2044: Add system controller device
>   riscv: dts: sophgo: sg2044: Add clock controller device
>   riscv: dts: sophgo: sg2044: Add GPIO device
>   riscv: dts: sophgo: sg2044: Add I2C device
>   riscv: dts: sophgo: sg2044: add DMA controller device
>   riscv: dts: sophgo: sg2044: Add MMC controller device
>   riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
>   riscv: dts: sophgo: sg2044: Add ethernet control device
>   riscv: dts: sophgo: sg2044: Add pinctrl device
> 
> [...]

Applied to for-next, thanks!

[01/11] riscv: dts: sophgo: sg2044: Add system controller device
        https://github.com/sophgo/linux/commit/50fa2633c143d857a68128da387e0bb09c6cd362
[02/11] riscv: dts: sophgo: sg2044: Add clock controller device
        https://github.com/sophgo/linux/commit/acd836a65b8cdebb007df0c3e08ac5710f0994e7
[03/11] riscv: dts: sophgo: sg2044: Add GPIO device
        https://github.com/sophgo/linux/commit/8fc13510b3540481d291e28172b41b571ea078c2
[04/11] riscv: dts: sophgo: sg2044: Add I2C device
        https://github.com/sophgo/linux/commit/b0d0b60bc906160aa3a1654de82c24bd55a801b3
[05/11] riscv: dts: sophgo: sg2044: add DMA controller device
        https://github.com/sophgo/linux/commit/e40105024f078269a9729f7488945c11f4f3422e
[06/11] riscv: dts: sophgo: sg2044: Add MMC controller device
        https://github.com/sophgo/linux/commit/4a678cc75d580a6478bcfae60907fa732d485368
[07/11] riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
        https://github.com/sophgo/linux/commit/62d6db9792ff7ddec27a61df8223395b22860c0d
[08/11] riscv: dts: sophgo: sg2044: Add ethernet control device
        https://github.com/sophgo/linux/commit/67970c99f040c3e26677178f323993ddf11cab1c
[09/11] riscv: dts: sophgo: sg2044: Add pinctrl device
        https://github.com/sophgo/linux/commit/d32d3c657f4f8b45ace6dbdb48ad602fc9a44be8
[10/11] riscv: dts: sophgo: add SG2044 SPI NOR controller driver
        https://github.com/sophgo/linux/commit/502ade8b6fd981ba3694000e684686954d73c3bb
[11/11] riscv: dts: sophgo: add pwm controller for SG2044
        https://github.com/sophgo/linux/commit/ea389214c01b2767ed2bbd4e9a03573394b33fd3

Thanks,
Inochi

