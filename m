Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C42702D5
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612227; cv=none; b=Gx6eaXeA8nuYcEZCeGkmPkBQM/0YyDmMxDJkJ5f61xyI7PoaWE3Tq1bYyWGQ/J2Rr9UIEXAOrIzFdNyqwhxhAdRe3lAOzNsO7eyAMUdjBsAYK6Mm2gU6etUQ5BkvE0x6kwtP/Y8yWeqgDNQWiAwAsJGD1N59zkUjSFTLGQJKYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612227; c=relaxed/simple;
	bh=NS1U6w0kHkdvmIq20iE8adLqx2agJBYWUsJJbrc1VOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTWX6jlk/5UNFWfVgmA7dY/d0LAsafJpE+5I+kYapCpHEThssL4fK+24wlWgErDpl/uLteiNjz1fdIoIljVb8ti78XhULfRbS433hIVanh4L0l+O3P+iIeShD6eZoQo8dDNwWkE1DMlJeRAPF2VH/tIrE6rjTkQdBjNq83ccZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm58mxcb; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm58mxcb"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so3082486d6.1
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740612225; x=1741217025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ybFFMG2SumuDeFcEvYzcDXHRApRA6j0FZMG4qQ5XA8A=;
        b=Pm58mxcbQNk2at3SNCcb7JtabMWE3BWSH+lgobzMT/inCbVYl3FJ+TFgXzZrlTcOmY
         azMXtgqrwbP5A67yj1HmfPKSdW13dDHSwOIAgxR5lUjtB8MoOXMOYts0Ca09YkuUUZZc
         gLy+u8/JpWBHg8grpYu/VR3awEOOPkXaByhjg0j62VH2IBv7ssaVdyYuYaoxCToHAGXv
         fqq4kg1+7oe8Ld5PBnWyeNSNapCB1O8XZpYVFAW5syth7AQmM7kjnlRVU+rvIbXDBRHD
         f3e44oLimIhpRXJtVjVQYyf2gVfpBD85q1nEuhaKqX3bDfy/MLQFGrGq2fBkcfli1ISy
         SP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740612225; x=1741217025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybFFMG2SumuDeFcEvYzcDXHRApRA6j0FZMG4qQ5XA8A=;
        b=Sq2su1LYx0DM6rDJQxAZbkVJWfz7pyw97T+yDqFjPuvtfUCOsYg0UtxaRBHRYmetpx
         ij8TVnxGb9TvognFLJhC6DPx1CYy9UI9un4Fu6OqYf+LYtwbS9tSgAeSJGMPdqSAlVl/
         hxFVo2i4v2H5Axi7Mw6Uo+3mp+l5DYP7l7y16IpyCtF/YN6NBiBJaI+O+3PelrBUOxsP
         CJcdE3/gy6sG6XslWQKmxwiTaoOfU66GObKiXtex3XaRtV82ZuUk5MrN9qOJjjjeDwX9
         5GNAcNNqI2tpL96uu3FWjG4nGbWcChAAts+yJPwmg5GaXTsEYMyg7y636SfMwJf+MmpC
         tTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQhYR+H+LWSn7vGZkHLvSjVxyBD8SHFaGlkTJTYteh7x8kXcBIlSJV9aD5YrUw6RH/ZMtoxeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwELsrlj9aSh+k8lPd/3iXvDFlMxoZ+d+/6LxlaoHaDtEfklY4Z
	7Oxw1QlFG+hUIRSw7h1KDdTznAL/kKWs+mryivuokFRsWZ6DLtiL
X-Gm-Gg: ASbGnct4PrkyQ2Rzmw5/+4PRN5FgufxIs4N/l4sHv1hpoHVDJ6Z/M+UTQrpoUidxa7h
	jo4gphXdgQJIPJZAtBmpBy27+tjKd2pXeTU09qtcgY9S5CGCvoDnGgfKgW5fsDIBYAvGMqa5cZL
	LN5BiLbEKd5JmxvRd2SXVTuMD0lhZ18k9hOmvob3H0jcx2DRtpAZfn746b4HJ3HQnr8gINcdUUH
	Ldm8DXYbKCOy4IpvKUYb/uDwEwmzHiWHaYaOMlJHXYvpGi5tdqCOHnTsueIJ5n6fJYyH1EZ++Ct
	QA==
X-Google-Smtp-Source: AGHT+IF7cAYgeZFCIwEduu3hnNA9l8ESzsaaMKaj+MfGgWzkHkWX96Oowim500RK01tBq3mq5C+HwQ==
X-Received: by 2002:a05:6214:400d:b0:6e4:3de6:e67a with SMTP id 6a1803df08f44-6e6ae967571mr246610626d6.30.1740612224915;
        Wed, 26 Feb 2025 15:23:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976613cdsm2287886d6.56.2025.02.26.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:23:43 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/2] clk: sophgo: add SG2044 clock controller support
Date: Thu, 27 Feb 2025 07:23:17 +0800
Message-ID: <20250226232320.93791-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller of SG2044 provides multiple clocks for various
IPs on the SoC, including PLL, mux, div and gates. As the PLL and
div have obvious changed and do not fit the framework of SG2042,
a new implement is provided to handle these.

Changed from v2:
1. Applied Chen Wang' tag
2. patch 2: fix author mail infomation

Changed from v1:
1. patch 1: Applied Krzysztof's tag
2. patch 2: Fix the build warning from bot.

Inochi Amaoto (2):
  dt-bindings: clock: sophgo: add clock controller for SG2044
  clk: sophgo: Add clock controller support for SG2044 SoC

 .../bindings/clock/sophgo,sg2044-clk.yaml     |   40 +
 drivers/clk/sophgo/Kconfig                    |   11 +
 drivers/clk/sophgo/Makefile                   |    1 +
 drivers/clk/sophgo/clk-sg2044.c               | 2271 +++++++++++++++++
 drivers/clk/sophgo/clk-sg2044.h               |   62 +
 include/dt-bindings/clock/sophgo,sg2044-clk.h |  170 ++
 6 files changed, 2555 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
 create mode 100644 drivers/clk/sophgo/clk-sg2044.c
 create mode 100644 drivers/clk/sophgo/clk-sg2044.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h

--
2.48.1

