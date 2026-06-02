Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA63812E3
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388368; cv=none; b=gm9FTaOx5/+h7DZR2zCuJITgZ6LMoG6iPUr8AjwPGGRFAp3C10gXVeD+SXAyG/IUqFjlvpW4kXIOIxF8xdBTIrfiSxD9JTADMw41cOmCXgSXNA1WEFKjEVG5VcH4QXn7XgALaKkIngqcYTDunhIFiaTmoxpVke1XXARyvB89t5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388368; c=relaxed/simple;
	bh=a7FQgUNWApzW4RhPeXmT/dWcitDUF58z6lXLLcsZjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JymlKWWbaqcHCZqJDRQ9TOkwePW5eW7xnTGRu2gu2iLCK4xddGSQ9+O0x+w25aMMLnC7eXch9UNIm9cI88mwRvstauDT2Q/tAooG2i1l7V02A44VE7OqH47S2GiqW0A44qxrpaF3aQ+3KlWvvkTKPlimmOfCx0+IPLxJjLhxwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEscevG8; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEscevG8"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so862044a12.3
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388367; x=1780993167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=VEscevG8aNLB1Ukn/s7Grfeq5f8WoyCZds7h1JD3/8sLo6+PU9l5hF8p0mpriq/QPV
         ktgZ46f3nS9r2L6JuKsGmKfQoEQSb6uXzOYKpA+KCQsVaAZfQkBRCRyo1RWGhGGXY14m
         R2VQFDJdvHNDKvOeamPPoiNPY9UFuclGUZWTp2qMsDlKqkc32sp21bUtp1gAbd+Vav+k
         uqhTgFqjN4xlYG4WNlCg2tMFNBWsi8lBQE2OurwXGzhD4HVlbPDJxFizTe79mEQSl3tb
         ZCQFTMLB/3XRyG8NgG1RkCfKA4EfVZPyqrN3EBJWAPKqpgHBvcArZsWdVHQyhTNLLgx3
         gxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388367; x=1780993167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=HrBOKYTaY0JumW894PuWFlpUKKlMzng+2D7P7c8//tKWVrJAQcJEq1Asqkbz5Druj2
         f/G6uUBKX5rngmW2+t9GfrhouvmxNWPc6TvmWyQrVZx6h/c3eAT0vgCc4mJX7ZU5+iUd
         Ii4uyPLhnREF3GUD/xUXkAOF1CUy16lJzU2LI2wIM6OHHkD7ITFDz64iT668UGy0/BnY
         Ut7Xac9MEtJnai4nDKS9ssA5o+LUMuZQDfh250slueFXpq4C2MSLUJsgdokHIbYXkV6G
         SqOdJJ+A27i7h67KvmqkxMeX3m3cYLVLwPQWYIo3G5HlApRAtzsKFvrfutX78xkAbBxI
         ll1g==
X-Forwarded-Encrypted: i=1; AFNElJ+IFdThnSz1yePxyMgfciaqzbKpnj9xa4L3KEa4qR73pGin7zg1EAfsnB5SY3R+SpX05rNUXmk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK5Fc3Jv1iQ2KmaJLTyvp8X58uTYskn7AsQcChtGUBxdUMoe+H
	ncCIPZ4qtzww5wXsf5nfIylwHxbda0zRz74J4nK7vSL1V+iE1oRxgiud
X-Gm-Gg: Acq92OERWIoS+UT/mkf61AgqE16HucxrbRtgH9LhMnLy8h7WCV5q5pcQ15K/2Q9kBw5
	TYgn0MWm1EbXxh2ifl0Rd7X+82z7Ze83Oluj1OejDRnKHCZaq2vt6kDnpSGweRjHxcZEBAMJ2Rl
	Ow6cBa5CjOJ2ypbARDIdUOV6XD9ymQNFb1dlTvt72VV0Kz8vJjsiH6L0u99qmVqvKhJbRuUFjE3
	5HP3DhL92bOE8RI25vXmwUMt++EfGuIUCrBI4owrOidw4vFp6I18ey5WwEGLPoPce/TFP+flUga
	XRbVRAJ2zFMf8vbSqLRxVKYiVd28MThUj2BFzI6EDNNp6g9ytWODXXj0tERnhwMgm2JyfH53fco
	Jy/nXhYVIWYwRKmvSL0s554xVbzJogasGNPnI2YnnRcBaWlix8nxhKNBKP52JU5eQixptX6PFFL
	rG2ETylhByX3LPK4/1x6fxfQeBl84EbCr7nPOx9sGkdVG5
X-Received: by 2002:a05:6a20:9595:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3b427be8514mr16806476637.6.1780388366793;
        Tue, 02 Jun 2026 01:19:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c858108940bsm10413308a12.5.2026.06.02.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:19:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:19:05 +0800
Message-ID: <178038833103.2088679.3632311874557644565.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
[4/5] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43

Thanks,
Inochi

