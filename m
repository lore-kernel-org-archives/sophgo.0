Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679671C701F
	for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 02:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505167; cv=none; b=fHB+OCOZnVKjgqVT4TsguDr8ODLGmvYK730qvCj+ahTPIjgcjsax2dA6zIU1TWn+A4r5juTc30TbVhd+wuMlw3tImPGi6Z1aFo79jCV93V+R4e00TELYu7Cz340f1aasOASakMyCPUToWX8Mt91cbqmxXoqO11JedStwzkzVkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505167; c=relaxed/simple;
	bh=88+bNIzAlxYN1ci1rTDeBjW922J6fpEPqmB1ccuDPaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZZ9wclOrVGMe/SwF+1ZGrJNkLXNqfGt1KWOg6cPGAvz0Ta31wjM/S8dcHFml9E3TS7Vs0ZU9ojc9pktstv3KHWif+NUbDemzBd7Tt1h/bZZqCT9NexE/8VLKSLzHzX/rIupavTXhvUKpE9xejCBJZGix0Y0i4EyFdFSJs4aZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUFU9GTD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUFU9GTD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298145fe27eso10821885ad.1
        for <sophgo@lists.linux.dev>; Thu, 11 Dec 2025 18:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505164; x=1766109964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlgUDFgw3W20yRvzQZnPEu5u5tHChFQ6crwdHESAYTo=;
        b=QUFU9GTDLRPOCqOndvo0LcUYt8EibwyRUb7MeYXfmPnWkWdlPc53NF5iYLo0enAl2c
         XD34hIK4oh4D4dlz4ScpGizqQFIT4fyI48woVzLdVY87yWPX+Hl9xF7vkHn+AJJpzNEj
         r35J5ep4+giKuXx4lr6sod/qXljsHoQukXtuWp2iDE6Mh2k9S+iJyFAZB11QsOoQVH7P
         3fOeHVhGwFJK4wTsPJmvSP31aUsx6uwpOAcWkq6640TJEae8E7T/ZU1W374vA5g+4gZm
         f7CaPraecoFZAOVurSY88k/EYgHAmF2fQKSwtubiltbjwsh6M281ChqZdvFsudJKQ8/Z
         u/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505164; x=1766109964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlgUDFgw3W20yRvzQZnPEu5u5tHChFQ6crwdHESAYTo=;
        b=CbIt8UnLUd8n0KsxwnA1HMjwfqkqn68gBNki93r9chbFOXVtt5d0CA7kmZPj25sFU0
         wUsbSSjOBL7kMdVUxbYknpPNjRHHR1M7IHSVn1FVpoaxEG5VOWZtvNbCUDZtgLxrTe0U
         fM2hm3E5LeJ2aq7DmeFm9uXeNGh6jiH2d10t6IOfKJqQvilr9UrK3sefQXRymBwDUN+z
         7i6D7QkWF0jLtCEGVzMAsbBkv6qcaMcVFaue7RWVTDfHkIcWN2bj24QqnFDVVX4vwfLM
         1Jgs9CZvtwRsYE4osVEiv9gHXV/qskygS1yhUJRo4t9JfV8A1GA/B3wkr8mDbNvW8wPS
         qpgw==
X-Forwarded-Encrypted: i=1; AJvYcCWIquoXNwjTRss1QFqe0ffU6fVPttMYAWYn+wSLGM1Dc2LqedJ8LeLwpFgCsjvPh1C90B9nS8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBjdiqUIj9Xo9ZI5PhE8riWXS3N4Nq+Fb4Wilk4Rhst34M0qPK
	O5lwUoXQWm5TtFZZcb6msqL1magAqfpDh8boX7DfMv+sb2oHq1vqRLnF
X-Gm-Gg: AY/fxX7T+EoaJWy3qZWxtm+wbbmSeLFCtbq4nOmoqQpVrbmSYw3hBOo1XcXtUgJzGBQ
	etGiRpFfFqDZ2+Wxy+T6oNTqFjyupcEUbW0K4mjOqE/VgXFAdPTNPe270k8HyZBHBZn+qBlJrN2
	o6dmIf38IhuRlcqaFU3Lrl5U+T4xmwqkz366B4drjfY/7/NcxfF8XzGo4As9wN+Lrn4z9JgItUB
	KcK8I1+pOrkWDsSnNsTv6Cvrt0O1q1FAi1DImyku5ag1PMTbLzg9naZ3Q2AyJ6Byx5SUf4W86ca
	Fuc4EEUNwerlfEnm9rp1G/4wscQqGn4m3lGy4F8fn392Gu4WiMjBA2+BySaxZETurpLDFSBhtdL
	oJK3yc1Rs6Dr5FWW4HXtD/hJY0Cqmx44pfQnEnxJBD8IcqZhMEfbJkBmYbtN/lSU1IWIbfgiloO
	imovtrBfEAHK/Et32fd6F/
X-Google-Smtp-Source: AGHT+IH3Yw9NfBszzIXyVq9G5mI8Je1OQSv84u6vZsMXIzrC8EAZ85t54i22pt6sz/SEwSGENP30UQ==
X-Received: by 2002:a05:701b:2515:b0:119:e56b:c745 with SMTP id a92af1059eb24-11f34ac52a8mr455769c88.10.1765505164545;
        Thu, 11 Dec 2025 18:06:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm13483678c88.12.2025.12.11.18.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Fri, 12 Dec 2025 10:05:00 +0800
Message-ID: <20251212020504.915616-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 23 insertions(+), 4 deletions(-)

--
2.52.0

