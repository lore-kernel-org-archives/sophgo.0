Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935AC1BD9C1
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216373; cv=none; b=egPeLFLgMXJ2oQiAj0WziVfKgqxgPfVA5jlWgCAu0+bPorC+dor2hJTfs4A4PkORdQs6nyOl0HxgVi6L5NkJ855AZjy5Lc/yRjX2LN/YwXZM5dnhsr7v3t1WhIfU5NFRF54rE8ct0xnvqh2UPys2HR2456BjPHnhzqTi5RPam+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216373; c=relaxed/simple;
	bh=snU775//kiO8hT9dWLIma8QLQBoQGPOkDX0gzwV8JmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDn3P5tERhuEvXz3CBSg+tB5iiuttVHhn0wTHlF6mOwra+B5L3lNQpbQB8j6Q0kSGsUhN/cPVt/lJ30t6EL32N4MLvptBDZgzBSZqm8zimxfD4qbXm9lBQxMnb83QHKhFIsY0fms2kEK2rjLoJ5Jyb7MByngF6tZwOUOL0mUC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKRSEodT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKRSEodT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-236470b2dceso57162775ad.0
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 20:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216371; x=1750821171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=MKRSEodTwpScbvKjjU8wgYSpL4ZYjlX38JXTZUpKPBoKt9JK5nvTEdAj3EiZuP0GSU
         ergt3mSd9iAeCReH4meMj7t/VdIOTquD27C91H7TtgD1ejLSY3WOTivKBprKZjWPHyAq
         dtP3+bMF4oMnP4vGwnO2I/rjFLzHzmnxaO8kErr0kmTgOySz+YPJCV8Rs2aIxyFRGOlC
         KHzlSr9DIFPstjeMhnbMzELbsSIFLT4FRvIaNu2bPqFbfPGCh3LPgBfIDj871c6Gs3Di
         OKUPat8fGcLc4nTTIRlEbanxHYdtscx6RoWOfD6NqIV18aBQW265Watu7hNpwdXXrSqB
         fD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216371; x=1750821171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=fIfrPHludpi38t/4lsqRgafJO9u4ypT0Rj99OLruRmrHQNHgdoGojaBaWtqsOd1cs8
         6GQ0csazjxi4KZl8pxvb/9W5Cv2YlFZQC0Ia1XClG7GefcuOl5bF1K9REK1zLukt731E
         lVXjDjYQzFJYg38Si2voOP6FzSD77BwC5YQ58BN4zvfzT+0PcveFYuWZgqs2ZOAbL1br
         eoANq1VOmZwQ6l7925NYj3vbh9Nik4A0DaEHreT4o2Bj12Dh+ikY7XjOFEkQY8xq5FnT
         otBh9xesVMCGyHu1o0+HyaNXjZ0TFtf2JdWN5b4G3OL5RaeDF2Zdy92z7TPyKoJewzsk
         l1sA==
X-Forwarded-Encrypted: i=1; AJvYcCXGcU8UTjLpHEm8lStrwB7tV1mtKOWXhBhXOoSy9L3q9BVA+ohhDU4yxnVy8v/r+xxu+/eWydA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8bx44sr8GYHr0U2vJVBITjX1f0PAaX84MDFausq3Gj9XorxdD
	mo8Whbx+Srs4Bh0XJe80RtQBs3OIIN36M1Nf3CioYn9XhF/KR5/nuBQr
X-Gm-Gg: ASbGnctyCrnzITbci4GV7O2GHPaIfAEFb7jnOEA6kOSh0BB3wtRCpTs/nyFjB05XLGM
	0hf227I0C2FjWvtUlozV8huxSumuAYtvCjVRBtHXijbdOvVpSRsAQfesPJ5iN8b+SaZktq1AXcI
	ABXdQ10DU0HROZhdKwaP9ERoTXcs7KREjmzDbbuKmBNVbsYufskg2JHvQGOTWnb1eX1l7PJFvRj
	SUQ8hkCPxa7Z/S1ra+tYK/v58Wlf92uivqmJ0Rs/nDU1SRrcZ0Fqg8sjbPIv0px+8JL50+TH8J1
	Qo3vvQQ4xCfFFCBJxiAGQKYkQneZu1p7ffC7TBv27q21Tl45b1w84qDcXSOjCQ==
X-Google-Smtp-Source: AGHT+IGlk8EgvUOrNowxfJO2EgnlRzNvjbjQNVRsCmwDyUQL2qNF7QpmdsaUlm4gLUxNgjcVNHsS2A==
X-Received: by 2002:a17:903:46cb:b0:234:dd3f:80fd with SMTP id d9443c01a7336-2366b316c17mr244719105ad.2.1750216370686;
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a1847sm89028055ad.67.2025.06.17.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo: rename compatible string of the USB device for cv18xx
Date: Wed, 18 Jun 2025 11:11:28 +0800
Message-ID: <20250618031132.373216-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Old days I added the USB support with a wildcard compatible string.
It is not formal and it is more clear to use a compatible for a
real world SoC. As the usb device is not used in any board device
tree (The patch for USB phy is under review), I think it is good
to correct this mistake before submitting the device node.

Inochi Amaoto (2):
  dt-bindings: usb: dwc2: rename sophgo usb compatible string
  usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X
    series SoC

 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 drivers/usb/dwc2/params.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.49.0

