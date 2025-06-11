Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9B234964
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629302; cv=none; b=PYSnh/iOip6p3flLPiX8p9ufEMtz6qy6zZxTZ3OZu4U0x6ZEyVcTb1nkroxqvZh3I2/DknY79676Y817VHKe0s+4uj28PKm07WDqldUMauNYHsZLZpAi4668XggXRAlzyhjn99nntPISelumTtfyp1BEtvnPZaaZIXA6N4b/T5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629302; c=relaxed/simple;
	bh=lGJb69/tpdP5rkGcIoY5vtL9R3Bj7q0/QtkMrLQ3hYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DDN3FYnmUejoCclKDhsSVskelzRLTrNdPlDaDNNrwPxpPVts/bPC+vv0xLoHeYHNHXXFyFx2cyVguSntwZly+IBbcYGr9HLx9INQCUguKuBauqaAbjv3sWggCp1nLZHe3Jgh+OZRyQ3gd/ZfIDOpjnB+rjhQFRbdp9G8Qu4kxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue3ab3EC; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue3ab3EC"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fb01566184so52690626d6.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629299; x=1750234099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NyvR/aWRBWqhSTIVuqpj6xfB7efefHvQ55Ys34H+rzc=;
        b=Ue3ab3ECJ6kl5BJEwM2UWz7e2gFUGQ2ub+11S42WfQK2EPAw2pInX/YUYrHvr4hQx4
         1mzgAp39X9fdGtDhcsSqQU9HZT4cUQVDtbY7+gN0Y6FdqCuY/7hrECfzNqS/Jfe9bG7E
         c1tMSs6GS1J5vFISsgAicDl6lhf88/hfQVII36gvpxigoN/smLLtBEQtNr/Wsj/0ik7p
         qYQDeU3HVc8aMceYJMUoBatn12nH6g83OrYZdlTVJKvj5ajfmB4HV2Nq+SkDux5RWZdL
         NxEmlCeda68E5NYSXxsz33uPxBSUiAx0onFV+tQrSsIk0RR6mMj/ofuIC/N0B45X8A7i
         cp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629299; x=1750234099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyvR/aWRBWqhSTIVuqpj6xfB7efefHvQ55Ys34H+rzc=;
        b=dKNMpBty4pfA7lDbPmo/O4Y0SsDCUHTgMbEkaaxgByPffuc13+8QD9E92QTVLOmT7D
         YEJJpiA778iW5ZZ4FAiHHLui7PASTlbvy+HNjeGg2ZYgtLBIQZm5SlnfK40EAaMNL4XS
         hs6AOpLDoPW8nTYxh+vVpTY/BgW+ZXCvb8p5DPjoMvHHLITNBAoVbD/RXJ/8+PbrskRd
         NhQ/r1uV+i/w0IoLOYFbLW+/iHjCPo+Ja7M1NzjbQfMNjLyETLfabDmDRgUfqu9vs45j
         z5jbW4YDzbPcPa7gsdtbj4Vf5lPtg+M2CcbgFGGMl12V7VYLKmmEC+i9VBdf44KTaUrL
         LhTw==
X-Forwarded-Encrypted: i=1; AJvYcCXmHfhyMNRbqi0bMwXC92OlXcLfbtgDmzMt/j49gvNFJ2SSR8yCoWbVON9XQLtUAhYSsFwxqCA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0LG1VSOlsoLkVi6YIIMx25G1L1gk+DNUlK+rBuk8ndHdsL3VU
	jEFmGJ6Z4aR+vjOdWUj3KsCsez5A8vGBBalI2QxX5D8ncclZBO50JxOO
X-Gm-Gg: ASbGnculLbKe4aHk2Li9K2vlE/XCRrP050B4KjxGZDuM2Ri0SKLQ/1EXgBO14NyP/F+
	0wLMQeUAK2Id+XmgCVOAINl0eRIjGELiUSyWIZFYqC5Bq8tiqBz92RPdTSdeo3VmLC6ed4THWY7
	0SJPnwHa+MAryiYxYEIkpv6yZ7945eWI0/W8If0giXnL5gZ2qYmJbAKqrjRuV5tc+TIRW7hJSRR
	lGSsYVx+9anZ+XmOXOFym7YA25Vl3w87gqQq7Zh2l/z+yTp7qxny9K/FYJ1o6VFyz7ZSeooS4qO
	N7jyofl2Q5JUB1qa6Izl9Fu9aXFElNN5abgKJQ==
X-Google-Smtp-Source: AGHT+IEa9ijPv2yRUgWb1+JJ15oOCUsNs6QvCIjqmIyulbMV9Myzdnt3+CF5kf5GH60kSH/1rsm0dQ==
X-Received: by 2002:a05:6214:c83:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb2c3272a3mr32641426d6.12.1749629299545;
        Wed, 11 Jun 2025 01:08:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab9595sm79183636d6.6.2025.06.11.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Wed, 11 Jun 2025 16:07:05 +0800
Message-ID: <20250611080709.1182183-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device binding and dts for CV18XX series SoC, this dts change series
require both the mdio patch [1] and the reset patch [2].

[1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.com
[2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com

Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  70 +++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: d5162144180458b11587ebd4ad24e5e3f62b0caf
prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
prerequisite-patch-id: 1b73196566058718471def62bc215d2f319513c3
prerequisite-patch-id: 54157303203826ccf91e985458c4ae7bcdd9b2ba
--
2.49.0

