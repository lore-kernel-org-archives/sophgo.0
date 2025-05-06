Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DB1FBC92
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575186; cv=none; b=WqGraT4aD5GTn2ZcmEk7PxNs8JSGDfJ4tHwsJPpP2/zKQqCaiJ+Wa+mLBtV9QZHiq5TWho42fHj8SjHxa5hNG/UyjsOz6k5VnRGdaI8Zg1ykujE+iHPGxyHBzyfWkJDSQ548CDBZ+CyEY0KQA8kUCXYrF8zr6XXMB5TJx1+EgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575186; c=relaxed/simple;
	bh=B6iRLx81tiF2365iKD/myCSIQNO1TeC7kdHgjWx2T9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw1HLbYg5JuudoO1fvPRWLJGmjcu/JhApXfQfeyJ2YrwEs68PYU8OMGBohTtOhgWBF0oKRfU0GBCgYPL8ZzGFa0TIB8DLkLm4RDXH4xBJSdFRAufao1VtPLQnCPP9J21nVEAN8pJh7BU7vSzkjolegEHw4FkaovYcUgai4P2WR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBVmPHAe; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBVmPHAe"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c542ffec37so744337385a.2
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746575183; x=1747179983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=ZBVmPHAe/6ppQZtK8LpsM7uUL1hwg8n1ONdB0AIY/6d2NLC26XGP6M8lizT24ORIXy
         A/GT7okkSVhjGppytT9L0KuQ+uzbo7jr3t07/sOfflsLAhGP6r13FlUeRWbbcbf4e/ds
         m5ExCDij6YjsHpxR/Z+mftjAes0EwXZdeApP140pFoWwAPicaepYiWRj0itYbeNRsqNX
         0BmFSs9c20MNdOoOMgcA2PSvAE59JIBAXFtPITTSVoy0FRNauLEBxePh+FTmB9FAoCVO
         t+3c+C2BlvZTSvL0P1i+DMEWZF06Dcj95Rj2IXSgH5fpUiwVZQC86IrT22vJHZdvN1fl
         KcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575183; x=1747179983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=PghPkUioA81pAlIzFj9kwLPRRrMOJB27nR8QQ4WmTIXBy5YBmgo3YmgTzvNjac+jxQ
         7+bc18dtsxuAh3QHaAyIaw+393VL1NB1TXoL7m24zKkOq4NuggJfHB4merGhVkIRN4fI
         I39wT4yJrEL36WehdrRVQJBkOeA2B28OmHjYALRMneuAOh5dMA0n4fojn9GyL49yPnOB
         krcHX8Y8GndeXrVvo/mRShxOcG03QDJjyk+f5N9N0iuJxpWuIB0Y3bEHtW9b1jeowcnl
         3hjlugpxv3wAzIG5RMptXhvaRUgzjA1wsuTQlmYfIsweuMv9kmf18psxhvjUpLeRtEP+
         9LXw==
X-Forwarded-Encrypted: i=1; AJvYcCUrm9w1ekTFLTWZRwYaa6sxnReHW8y3tts+Zi84Fr30rpTBwZZHFcughnCqb1k6bMjE/YXeFuk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2yimi0wiXC4dPgpIxvZxzNEfjuwmEgzFytHCKzb3CwWrKv4AP
	GaCACEJda80/WzdOWdwANHe5qzEVzg/SYiUtyx1YJ3dE0ucw88/W
X-Gm-Gg: ASbGncsquEUzDA/FFWi//iNHNn7iUPaEYPK86vylyd1UnPFHvOx2gauyVx9Y2TMJWyr
	99dCzbLHpQD98z6UYql4ZgkdtgV1tvyOFBstUam5lNynEHBqtMYsDlu6yqgQfcIyVtF6cbavHEa
	jOK7osg3ASPPmLxrdsM6HglNHhP1exn70mBf0fbwWou1b9wNDCZ2M07tH/54+NUZR33VMAbDd8z
	9f0FBkNp7ETSgCJF6BjDkGEjEIOd+w7FHE0L6+eQlrkqh/HIEoJ+fJVE8kOiNU/ssa4/bZ+3v0j
	WgbeUdP5Px0htXS7RmyDy6jU9i0=
X-Google-Smtp-Source: AGHT+IHeDbXh28cKEU2lNRj30EE82yC2TAKjYla28J2iicvKZY5F7e3fcCLy0NDluJznncuzGWfCsw==
X-Received: by 2002:a05:620a:1724:b0:7ca:cd43:e46e with SMTP id af79cd13be357-7caf73fa4bfmr266382985a.36.1746575183537;
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf75b87casm46952985a.74.2025.05.06.16.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Wed,  7 May 2025 07:45:53 +0800
Message-ID: <174657514013.201370.6246239358631068735.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 04 May 2025 18:45:49 +0800, Inochi Amaoto wrote:
> The part 2 of dts rework replaces precise compatible for existed clock device
> with old wildcard one.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
> 1. patch 1: reused sophgo,sg2000-clk for sg2002.
> 2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
>             commit message.
> 3. patch 2: fix wrong data for sophgo,cv1812h-clk.
> 4. patch 2: remove compatible sophgo,sg2002-clk.
> 5. patch 3: adapt the change of patch 1,2.
> 
> [...]

Applied to sophgo-clk-for-6.16-rc1, thanks!

[1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
      https://github.com/sophgo/linux/commit/6d880961f5f9b84d13fb4a0208c7405966bc3489
[2/3] clk: sophgo: Add support for newly added precise compatible
      https://github.com/sophgo/linux/commit/dd8bbae9fefeead76f20cd410a5a8299fcbad220

Thanks,
Inochi

