Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B093224B1E
	for <sophgo@lists.linux.dev>; Tue, 18 Nov 2025 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428790; cv=none; b=P7g91qXTl6WopfLyutvJ2PotwSIPOhMG1W+OYgV2RptJ9seNSYpeUBW9ftCGOyWy7Y3VNtAb5GDim83L4iNsPrspGRdxH4+WbBCt6RNgiRwHaYpyop/D4AIqaF3plDbFB+GxUYeqSbeaLwKarikVlH82a5nkjngRzc1nucyLROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428790; c=relaxed/simple;
	bh=KfZrY4abbwxsQcwx1AzWdikpfTyaAs+44RSqcFkZ/Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sx5ncq0V/CLUy1OPZhztfAzP7i+KWkkMycju2o8JqSKE9aM5LpkYanDhC/u8InlrqCHvAILrNjSvwDAeelRK3NTvwEeIhmDEQYbaYgxluOngtSfXcFaxTsjrbOhAeRTLIL4X80STDu2aq/H0LHUAb6aWW0LSJIeBzfkWKU3E3+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2ELQUY1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2ELQUY1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc274b8ab7dso3508494a12.3
        for <sophgo@lists.linux.dev>; Mon, 17 Nov 2025 17:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428788; x=1764033588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JBgoq+z6jGecNEGkZTUmDc8yTXhWwsgJ8qD9aHwpDI=;
        b=j2ELQUY1b/RGq9T/JAIVqkvEaV6LLWFAfoJqNSD0E920crCYirs7mWu9vZb4jKH7mp
         NU5uuPW9+gAWkODBVP2Dk8gBNe9Dx7SEkmZcjtMtVhV/2n+uD+ap4AsR3iw5zfLug9gk
         t7sQjD0EYoQjJd5j2nAOJzM3iQGAKlA/e5LgPHF8gFwiYqMYUV7/n/78HQ4xc2gChjWU
         c4Kc+0TqFCjQxlIcWHKubH/uSIDWZbFli0uunDO9Fn08wrx69JW8UYPlro5mQchgyDx1
         tlX4xufyMdjxvQIx/KL5xvgixCNfr86p0zsts+04stpv32AdavkNIWBZ2ilRm7pGPO1F
         Ctwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428788; x=1764033588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JBgoq+z6jGecNEGkZTUmDc8yTXhWwsgJ8qD9aHwpDI=;
        b=KIRhy99xGIbzhOrs2y3YJQ09aLT4hyV8kAEQdWcG4cKNdttEhKZDJZBpOqUiYd3I/s
         BqPyFuEO/i4Md5BXLRJjfRyecj5o6Sarw4+wa6J9MHyPahmZ8sOr54JvAzaaj15STfuR
         /rsvjx7hAnK3SUlj39Cv4bI1vk6TsBTR6XflrIpP47a4hAVQBGYzJt3gIvIY/CuaAozg
         bK7kdL7pWg49+QAGAL+yHlza9CvzjQgg33UWe51EHyC32clcG5EaLvualYcMpihTx/OH
         9PlyhKIQoS9wv/xamXbubKlvlffZnHCC1GChXr4Qk5vkNP4cqmfJhHBeMm7fR4+4lvk8
         L7dg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6HH01+1JR7It1v5XxKID+EDpMLIyfhgbjvTWW4HN/u1QoCl8DP0UuOLMnW/S0lNoctc4o+s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnGfliiNJbecGXjAxxsRKQmbsWIFuEIVSnFj/qn9PMeBPsKPWS
	aCjlH/r6rh8L/nLyy5pt3ltA1YBfHLAy8yz6oB+unZhbnCGLlB2jongm
X-Gm-Gg: ASbGncvTlyREGgU+NaWSvNmN2422it2Q4YCXq/sllBoEX59CdGsaT12lnN/oXeqVqIv
	R1CnpRzVujVOUDHHnoVJ8ex9iyP0Bl5N1Tp5wsDUzOF2xhhcWgOpfYGu/cMOKX+T2p/d4Sr62eU
	RiIEDxxDDYDSQnKvvSHE2TAIlu/4PlwJo9GBiyy8supTrsgxhNqTNM9dGbJAk1VMqb4DkJuFBRj
	XYkfzXFDHjxKeJ5MIk/CTeOzAh1zoNG6Cx6k6QtLRJlyUOI2J/MxMHyadDDxxTS8Qw8Uu6iq9N+
	aUZ0GGhnfYybd/Wx7mfsppX5LMjCxPixSf5ZWFyPWZ5x86owQ0hL3woaqzhW9LGHJmDrlH3dqSe
	GeTzcSc3cY/IJ8gDF2oMdM3i4m7ZStKGX00+S7tw3wN9Wmh9IlWfW8LqAO+cz5cU5Fti1oKJ7jk
	0AJpQD/ObzLtgXY3NXMO+KEYakeVuk6Tk=
X-Google-Smtp-Source: AGHT+IHAlVYCgwLwhG5dvCsbxSy4/6DoRbKsslM0o7aXrisHTVE8SaDF04sXPQlYXdqI+lq/6xvytQ==
X-Received: by 2002:a05:701b:281b:b0:11b:9386:a381 with SMTP id a92af1059eb24-11b9386a5e1mr2777708c88.48.1763428787615;
        Mon, 17 Nov 2025 17:19:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm53255982c88.0.2025.11.17.17.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 17:19:46 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using it
Date: Tue, 18 Nov 2025 09:19:12 +0800
Message-ID: <176342869620.638242.11529006624321296909.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 16 Sep 2025 21:22:49 +0800, Zixian Zeng wrote:
> [PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
> [PATCH v4 4/4] with content changes:
> 
> According to SG2042 Pioneer and SG2042_EVB_V1/V2 schematics, SPI-NOR Flash
> cannot support QSPI due to hardware design.
> Thus spi-(tx|rx)-bus-width must be set to 1.
> 
> [...]

Applied to dt/riscv, thanks!

[1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
      https://github.com/sophgo/linux/commit/59dc89fdfe0bbcce186116651bd017cfb9f70fc0
[2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      https://github.com/sophgo/linux/commit/f49314cbbc98f9ab2bf4eb82ccacbf79f179db6c
[3/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      https://github.com/sophgo/linux/commit/11f4d84c9f724ec4c6810567d6b9713b054bb28b
[4/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2
      https://github.com/sophgo/linux/commit/af5eb17ff893bf6e52680a31059e1816749c2d20

Thanks,
Inochi

