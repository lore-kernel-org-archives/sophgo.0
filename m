Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9F62C17A3
	for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752619129; cv=none; b=PmpzUIld/50KzBs55K+7x9ygnRoHbMGbt8wlXQQAs/wAXcTdWcRrgxenP2YIPFYfnlFj1Wt0WsrTYhW5G0wVq1cIZTUYVW6wj69vRQsx2TXd4N/+Kr02VJVL0Rf4m10Bc0Veh4IvWGq8uGwHMufoXAJHm62w5Bt1gmjUQyMXZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752619129; c=relaxed/simple;
	bh=kSh8rcNf5ojIJ4tUvmBVO6Riz084YDO9AXyv9jzz4Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiKPvBX9fvcGgGwhxCd+OzJrALvvMawO4DM3YeZKY2MBKngCLVEQKWayNnYDMMlO+Brp2kqN6kKipythv5qOHHOeiuxHlDRask6xzOJMIBaLXdq5gbROJPMujy5zO8SQPOiAow7f195kfHLhxiA6/z8OBc63n7eArOiFQ/q367I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs0ZQ0bM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs0ZQ0bM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234f17910d8so59912155ad.3
        for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752619127; x=1753223927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMHzguab1ISG60/Qj0OMV0c44NRNKay9hHw27b5AXY8=;
        b=bs0ZQ0bM43eM1TeUueykB+L4rgOnh6AkRH4VsaB9gk9frfKs1eeBIxBKKRwlb8h5jU
         sotKGTvK+x5eL7oPF5qPmnNktZ/y/O3dG8p2ZIHLW2DWsNU9iDa2XQhX3Fqmo0jBL/e2
         LQ8UvP8SsnnprHv3R+Y17EHGubm1b+wJLPMc7YTZVIYay02SoARVgs1gyie8RCUxIeL7
         BIcwPiLZXwmElKChVEa/heEPHd9eali/NyWCT1cBaj5XxkdhWwObEtcx3tZTZ/encF2A
         PZnXnnVOoSPIug35S+2mltEYp5M51RDU5KuEv/oFU8X5Tmes2tDHbenYcuGW13EC3NEF
         aFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752619127; x=1753223927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMHzguab1ISG60/Qj0OMV0c44NRNKay9hHw27b5AXY8=;
        b=vlJkvQQCxNnDwZBukt7R25YbR3XNN+/E3STKst15CChhM4S6+c9KMVy/K8rXs0kExm
         xuPwlv4P7AXDXQ086HJtelg2lhZ8jEYiY2In5aDDy0XGFzlCAEiSQb2f2GV+oFXg06IJ
         gd6ezWZ6me/V+Cwgw9bO8BEYSjMJgv3DuT81EtWYo34/M4MnsxkzrUGoUsQBuySx6kbs
         20YMqdy6mtC+ppdqe2yTRCqEWUr4apARutS0QxcKgga3pejoIdXuYm7VEfgW/aqU8uBe
         xtPpzgkERvJx8TvYGgk9dRTesggUhoVTqAk1xw2eauS/5uYAAPu6gvOvcC+riAzCXSjH
         5TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCVfyaaEx/9cV2gbaVHj7kqFB23VjYhaV+bz2zsGlFUtq3fvVmTzv6z7eFNeYUqz8VKi86eIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzol95UGaQK/U0jypvFW1rHVW9f6cAmzbDghb1FEe9Fwji+3CoG
	KOpH+TcXaihNn0mQSW+279rH0yxxZcRsWVyqroj7xJf+ijuCDVjvOva8
X-Gm-Gg: ASbGnctqS3SmF9PbkAZFaZEOu9tz3L9sb//hQXnPCY7jzH8uERwsrLzwPxboMkcA/Ko
	+HZeqduwS/RbjP8diTU4hp7UxMLwocj/JNWW7Yn6WbZ6YjdJj/tLkrqLvSPnL9bbO4JUusABdtT
	wTUoA/9px5LzmrS6kNEtl5mvrkd+rd68U8a6pJucXGN1tNxbIu1LpWZN1II6IXx9X2SNyVoIGbs
	CuCJkssT2TTKMyVRy82XgGg09xc14NJK7IDGeJD0hEqjNYbcrMc20dDz8j5I49kA4TlKjbIaTdX
	366yaNyUGjgV3lc9HTJ2SjyHA+IXhENVrEKPl/Mbn8cAGAG94eJg2ROa/c5edlcXY8uvi5Pbn30
	8canT9mSi+aKaiJ4ilrM2EQ==
X-Google-Smtp-Source: AGHT+IH9n9nO7kec5bACwYWFm50WGXSEE20ljzK3YGhA8V2Hti9BIGctkVsu30lXV9YAdLdqJiq7mQ==
X-Received: by 2002:a17:902:ea0a:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23e24ed635emr9028845ad.14.1752619126885;
        Tue, 15 Jul 2025 15:38:46 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de435d42dsm116929105ad.233.2025.07.15.15.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:38:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
Date: Wed, 16 Jul 2025 06:38:25 +0800
Message-ID: <175261908156.94132.11302071914429106821.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715221349.11034-1-inochiama@gmail.com>
References: <20250715221349.11034-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Jul 2025 06:13:48 +0800, Inochi Amaoto wrote:
> As the mdio multipledxer is marked as mdio device, the check complains
> the mdio bus number exceed the maximum.
> 
> Change the node name to mdio-mux to remove the following warnings:
> mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
> the maximum of 31
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: fix mdio node name for CV180X
      https://github.com/sophgo/linux/commit/8727665368cd4af112146b650ec0ebac038b5cf5

Thanks,
Inochi

