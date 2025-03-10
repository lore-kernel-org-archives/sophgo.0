Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FC5234
	for <sophgo@lists.linux.dev>; Mon, 10 Mar 2025 04:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741579730; cv=none; b=Rm7UdbcsV05g25qCIa6duv2q8St786fU1wrwQ52IE+uJPmn9ZlRV12sHcqvsYpE0U31TybF7v58qoQGohBuSr5cckQaE7wtLtl8IP9mXGQtvOnPLfEt1PRrQdLYm4lflBbf1tw5o3hmHsaRkamRKLrcTt8SUx9DXcBHTtlA4GpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741579730; c=relaxed/simple;
	bh=fJYoS5wlG8QstMdby11IKTbGL41o3ycq8U79HfpMshw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6oeM4viID9ycNfIwL22l2hVdFXRKBmdPBEU3P4ugCacQ6diA/gzC9pAELRpccjVkk0EsLj59EJtosZ7uDz2f1pTxALSyHbPTJjzVVkyB3q478GPuph1V6mQGfkqVyf3qK7jr6qHtdyWVMFFFg1SigxHkk+BC4BAjGP6LI5u638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjhbIcOW; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjhbIcOW"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c2303a56d6so439836385a.3
        for <sophgo@lists.linux.dev>; Sun, 09 Mar 2025 21:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741579727; x=1742184527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VOuggK65iHL1WrZt7LgIkYldFFZ7T+Rk2QuSTsMBqc=;
        b=RjhbIcOWQEGh4kn+LJGyocot+PeOp0CwGtEF+jmRytxaW/0rt2SnFg4Xzdw/lF7SYV
         IgzwyXLW58PTEnFJOYw4WoG5lQDn2+8+AEz8mf6FKNxvXer8Kw/euupUh6AOrHMBYJgi
         x28F8LlwnzvsWJIEG6fw2Y7ym8P0lQUl1fnyr7U+GKgdWjCGwwHgRnDScAPOmUJTB68b
         oZ+w0Oh8OEurC1PcaNGDetzWXjmMVRIi6Y/Q5+tlv3jAgGszQFxNEWa/mcI3EGo8rF5V
         dl+hS1AvttXnwSMntXaRXd/5qClqdw9B6qquFptYlHoLkChccABb6U9UhFVQtZYaqRFj
         3VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741579727; x=1742184527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VOuggK65iHL1WrZt7LgIkYldFFZ7T+Rk2QuSTsMBqc=;
        b=Eref6s9aroIxao69gwwl6+UynaE3++fk5yXo2DAJKxBGwJ81MGtBKM7UTfbxGgZ3yK
         07KrF6q5eD3AHymH8PUGUCJrt2wQbiEEs/GL+nLM8T3jfJYqrhz9DZ30DSBwQnwtpQ6a
         hI8hV7z3mjza5drqfDnDshb/Kde5cUFCBUJSsrFTTN6fGqjfmllPkVPDPIUfEkhHyOxn
         sMbPjAoLU5jzO+skaAjggOJT9oeMjhCW+yn5S6Mg+EiD83BEFWJXAfuxf2VZ4ymjOq8c
         EB7bG6EWM1oqLTbvu0SpjFY5R1VaVxKWcq15S29CEM+bwhUlmivQlQDblNWjUaYucF27
         QzJg==
X-Forwarded-Encrypted: i=1; AJvYcCWFUfLQClquTDULXHagk3qIHSCop9GzKJOwVAMFglwNgJ/u09TX/zxA5Lr3yUwx2zhlc2QSWCE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzX5R9lus2RnbD6sJ3iqOYKFRNV3s/q4FWiwEL/b80rybp+N44T
	om7r8d3dkzBbNna5RdFr+irO+fcNHUZZW1HDxo+awMVxPIsiIdbW
X-Gm-Gg: ASbGncuBlkJEihii2jZKlGLlTNt0Vgsc4vYCSyl0wV6l5pyH8V60fs2r36M3A7oWDln
	rBDR/6OlOgCS9Rkiy+hPjRthxkh2lob8foPFLLRzgifWJ5xOQ3d/f2xCGT+bb5BXbNM4ngpRDyb
	/6QrCXh6mtT4MsW3MUHN9/sPWfBKARG1bIyhkCXAIshVkjTLSogn3cJaMcHyuqvkY/PXyHscM/O
	470duHR1RaORiRwLB2Z9Zb8S2XOprsUu9NqH8A0I/L0n8UwSmnQTBpV/vloXRX2aRgNOxuwU1Ke
	AI7ZqJQFSJ3JyL0LrOQD
X-Google-Smtp-Source: AGHT+IF48MIEuo2MOFTyOtajCaIZ0VDeA9fTgytDQQC+qHk6FufxDgXmhh2qYRm3u0obvO/2DLZIOQ==
X-Received: by 2002:a05:620a:278a:b0:7c3:c421:3e92 with SMTP id af79cd13be357-7c4e167830emr1619956585a.10.1741579726778;
        Sun, 09 Mar 2025 21:08:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c557e08ecasm36964685a.98.2025.03.09.21.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:08:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] clk: sophgo: add SG2044 clock controller support
Date: Mon, 10 Mar 2025 12:08:32 +0800
Message-ID: <174157953239.287836.12496608762621997429.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226232320.93791-1-inochiama@gmail.com>
References: <20250226232320.93791-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 27 Feb 2025 07:23:17 +0800, Inochi Amaoto wrote:
> The clock controller of SG2044 provides multiple clocks for various
> IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> div have obvious changed and do not fit the framework of SG2042,
> a new implement is provided to handle these.
> 
> Changed from v2:
> 1. Applied Chen Wang' tag
> 2. patch 2: fix author mail infomation
> 
> [...]

Applied to for-next, thanks!

[1/2] dt-bindings: clock: sophgo: add clock controller for SG2044
      https://github.com/sophgo/linux/commit/0332ae22ce09ce64f5e54fc2a24ed22073dbeb9d
[2/2] clk: sophgo: Add clock controller support for SG2044 SoC
      https://github.com/sophgo/linux/commit/fcee6f2173e7f7fb39f35899faea282fd9b5ea30

Thanks,
Inochi

