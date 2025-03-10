Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C635976
	for <sophgo@lists.linux.dev>; Mon, 10 Mar 2025 04:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741580595; cv=none; b=SsKZJpK6Vn77ycDIvYTYgKSPrzMNsi8iHZg1gbysDyIhuPrjSUAiUGRmeY/0dDdTytIzYcbGYKqyBrCZW3/VIbRWnnyR7jZQww4tily1SDr5YplDy71wRNkXnDfvg3Wb5j6OzGNx2V4aWNaW58YRHD8IO5oXuSjyb264YGBrNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741580595; c=relaxed/simple;
	bh=62c0RD+YxE4Wo9QO1+8kjeiytsGGNxXazNbcwI6B09k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvqoMGwCb1GTKmQCWDOtMg6+EFEEXsZceShkIEOzC9OadMnhLgXmUoB6AF02bWG5qTOhvkKVouL1J6vLwmWrAH63A4f+q28a3sSL+cyN3ehmFTIlQV7cV9++d56gp5xNabKqloym0OTKIUAZFZ+TW+78TzyUKgF1h48+WB7LZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2M5u9G5; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2M5u9G5"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46c8474d8daso29343801cf.3
        for <sophgo@lists.linux.dev>; Sun, 09 Mar 2025 21:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741580593; x=1742185393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0gvF91ZJdA8vs8FXl/3hN19Y7G+bneODyyzgzAJB8U=;
        b=H2M5u9G5lSq6nSNSyA94EwqvH1Ofc+5St+z8ta6S4CidYoRnIiJ8XzUfthmv7jwme7
         xluNHxzBc8/Zg9WQUfIXpjV5jfxHJk2LOnDikMALYXWlIh4DpLqm5g+0vRNGZYn+JQZB
         43hNx2pWMWZpPTsLOe1O6kAN0o0Hz7lUeEKlwXo6eE4Ncb/tkQ29XdGkCWB/nL9iUU4t
         3nk32dSS2lXCfuNY5xfFqsNG/UKjfwZRPN2f0Y8XTctMAiS0CSWpMmkdPiBe4Swxawst
         9pyXl4S96I1Jfn6rIVyXAzaIwWKTHXNJ0OaZBcuRBNoh7eN7pwGLOkFC+G2NHBSfwucw
         2Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741580593; x=1742185393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0gvF91ZJdA8vs8FXl/3hN19Y7G+bneODyyzgzAJB8U=;
        b=smnli6BqlDg05UUjgHZPRUsywSoGOHoabIuTsytbx1/Twr9bUQwSV1ObR8MKkMLYPU
         /xNQFilsgx8taUheOUc0EDtGf3Y190gR84M2A9nQcZ4ksqb0tPuQszoGMLAw0NImcR8r
         NnvJ88tDiay74i735Qf/ukmGCZ/ityhUAzG3Ra0sLVlNJmX5EIse0NXqvxOXOGdYy/ck
         5Oa6CQhS6xU2OLckEUItTIFRXy/uNgBAaW15cUC7FVQXl3LeOakCe3raba/Q9Twwq67y
         5n3yvfeVykmqYbbfhJzVaFQybGwGsTJCchBAC+jwCYH1JjYr0TXZGmY12t6PDNBabfkA
         tASg==
X-Forwarded-Encrypted: i=1; AJvYcCV37UiT5vEUKs5ML5bwOxObZVS+YLfo9/56qABDjp5d2ApWwRzqPiPwsuQmEMHNZ9z1puHiKeE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH4s099ASQQYi2/xpQP8yHxGM9r2o9MXXdF66sAKIwRzr9IRwQ
	0YEBGbYqclg3zUj7CWV78pEwTzNlneFTGqIY4YCRi/V3iHpbs979
X-Gm-Gg: ASbGncs2+HmgmpzexorjbnkAHdu63saNE/ByrDHoeafOJRJ5eZPfoJmqWWI9oHmakSP
	hfEpw5GshDu2PRInpGD3ZmwV9jxSSznp1hqWnYUALH3sqj/nQhF4bsCNpc2dWMec+QZ9GE3MBKU
	wj+/LuYKPVQj7IID/JGDTjgixlr+bDmlPirmcserNB4Me0T3F1CYudjNXAJnE3kgVGAJZE4nHVr
	Q1qJZ/5wrjBQFUA73KMZIUWzlfaeeq54GNbW+jgaCsSYzHZymrMj3jmxJKr1RtVUFoyMakC8Lwe
	cPFwY82/1K1DqmG37dAj
X-Google-Smtp-Source: AGHT+IFa5FvD8Q+HfgrKvsdng+6SJ6uYosnhp53MikJ0vblkdZDvMi04uamcmlnlcuzE7xdu4K+eFg==
X-Received: by 2002:a05:622a:15ca:b0:475:a5a:113d with SMTP id d75a77b69052e-4761097d4e8mr175686521cf.14.1741580592911;
        Sun, 09 Mar 2025 21:23:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4768344ab36sm13774281cf.9.2025.03.09.21.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:23:12 -0700 (PDT)
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
Date: Mon, 10 Mar 2025 12:23:03 +0800
Message-ID: <174158054219.311416.9651103100123387748.b4-ty@gmail.com>
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

Applied to sg2044/for-next, thanks!

[1/2] dt-bindings: clock: sophgo: add clock controller for SG2044
      https://github.com/sophgo/linux/commit/c90eac0946162efb7436098f25e21f02bc483ada
[2/2] clk: sophgo: Add clock controller support for SG2044 SoC
      https://github.com/sophgo/linux/commit/135418add3878dcd44483d0f2851f6f470a85395

Thanks,
Inochi

