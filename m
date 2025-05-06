Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DB21FF20
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575189; cv=none; b=dcemqh85xHSR2fU+DFCXJJbEDW6HZBdehm3E39SPN5gBsJ9gFtETQaRfEXNapm69wkbUhrMDxikQg7oJGEMiJj655FJRgYyXbHRNGq4TzeIMFDdTnhRe7baoUYH3tcBkEO4gXE0RmnPusLdXyu0d/K0ZEdBpzTfDiC2DRPFjibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575189; c=relaxed/simple;
	bh=BVt+VRnTimWp4JzuHa95+Dqz8viq8EbnD6FOmmPQr/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/NBEsfeVJYBToWznoo/ex3gjaYid3FxVbjyloDEi7ww/JOv0XilecXsTOuXmP5Z6qSlzula97ciiSTcKOFELfV9vg2JDzQbdATpTc/XbFaYpgkMSsI+p1DUr78lA4My1E7TUmFIXZyw3jM8+2lpRL7ihb+YVYJ+4Z77VDXc11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0ujWo+q; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0ujWo+q"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so73273216d6.2
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 16:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746575187; x=1747179987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZFBhA4aKbh9bxYzKReOwT6rRAW6REfyh6NppyF3T58=;
        b=Y0ujWo+qneKwONykMuYTzPw/fFqDr+JNkl76ScfLMESRydU4JxRnddhpB4UVneYfXQ
         JjuRP7aAb5dqhMhZHzsTQJ0E5cdD+Q0I4L8KLXtSqI1bRTXGWdWDep5A8zrGa8cnzHa7
         lnoMwgmHb20UplsOA3VWXI4OIuEC6aoa4BXDwnJ+wIl8ej4rUT64wBABG5W1O71DIQ51
         2Dq/mNkYXnxYeOkFnKn3H0wf7x5lLBSDMzicFqWmza5VJEVSJUgEMrh7X4tUF8QJiG4C
         FFuvk80Ko3R9yK8l9S30j+TUicwsAfdP9HZdBRoWfh6VacUvy/PfS6pXQkf4Jcouggyz
         e72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575187; x=1747179987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZFBhA4aKbh9bxYzKReOwT6rRAW6REfyh6NppyF3T58=;
        b=RkavLqUu0dhOL+WgvdFhgAMkLOWIUBc+/MnPV+5lgoajs7vrNjUHLTzAV9H+xlMkES
         WrFEyuMtCgBVBm2aAhyzDAs3TBuKoS5E0LCYReggF98GYxcjhi78hIjSlPhr2chY4i1T
         wQYgoDzlMkapiLuqtn3MrqG6sRQZgF5gGbDckZ3XNUwBfhdxEuU9911rx1PsLT58hYFb
         p7UcputpnwoSci7RQkzS3v7yYqaRQAG4VmHa9E6iYucq5700t45z3wqnK8KZXupPOjCI
         MpmeaRtj4DQnQDUW8cWNOhhWykKtwCl9jwMT3zBnTQrUzJ2J28h5rZHMqwvCNwa5JE+2
         dV8A==
X-Forwarded-Encrypted: i=1; AJvYcCXuCLZFT4gtcp1cRveFKa6JwtvnKNmUt03fBkpbR8cRINi99sIcS714/1obJ8zE31qqxf5jzew=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMwBqES1JdAIePiZ0IqJD2DOJVramCtQjs/xm3LN8IBYJ5nRzg
	BXF1+17ZTk98m1hshSbI6GKUp+wszq4nXs8VN0q0oIruMd6dh8KP
X-Gm-Gg: ASbGncvJVTTRbxLIzp65mhZHpyMTKVM8abBMKyx9jIf3/2bH7Lq+RzRkPxmCandqqbV
	lv2HY2oXRMwjhB+nXmsCtm5YVa41Myb9PLQ7btaV9706Pasyb9Wsj3HCiK8tlkxMJgDoEwjQdFQ
	9RA6GD/A4j4imaEPKA2+tCYO0ODoSnp+WNA+T+tqzrB846S978SmgFzo7/z4qA+V7x68yQxO+Qs
	tSzbV4VZgkg8wDAV8jeyI+oA8o2UhxBDD9NjDl1bYEF/y6b7uji1ilFbXDj0MPiPOL835HhVBI8
	AcvhWwyeQcWC2vIa
X-Google-Smtp-Source: AGHT+IEjDlSavtkzKmbSQrqTC2t30r5tt5AL3W9m2wrwiZipklrvf6FkHZGOwnr9K59YfepX2GVs3A==
X-Received: by 2002:a05:6214:f04:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f542acd327mr19125306d6.31.1746575187083;
        Tue, 06 May 2025 16:46:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5427e2023sm4083916d6.125.2025.05.06.16.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:46:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] clk: sophgo: add SG2044 clock controller support
Date: Wed,  7 May 2025 07:45:54 +0800
Message-ID: <174657514016.201370.7208767895794181355.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>
References: <20250418020325.421257-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Apr 2025 10:03:19 +0800, Inochi Amaoto wrote:
> The clock controller of SG2044 provides multiple clocks for various
> IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> div have obvious changed and do not fit the framework of SG2042,
> a new implement is provided to handle these.
> 
> Changed from v4:
> 1. patch 1,3: Applied Krzysztof's tag.
> 2. patch 1: fix header path in description.
> 3. patch 4: drop duplicated module alias.
> 4. patch 5: make sg2044_clk_desc_data const.
> 
> [...]

Applied to sophgo-clk-for-6.16-rc1, thanks!

[1/5] dt-bindings: soc: sophgo: Add SG2044 top syscon device
      https://github.com/sophgo/linux/commit/e4b700d38957526fbcec6d7bb5890ad4c1192241
[3/5] dt-bindings: clock: sophgo: add clock controller for SG2044
      https://github.com/sophgo/linux/commit/1a215904986e48ce04ac8f24ecb5b18cb6beaf43
[4/5] clk: sophgo: Add PLL clock controller support for SG2044 SoC
      https://github.com/sophgo/linux/commit/ff5240793b0484187a836f6e1b7f0e376e0776ed

Thanks,
Inochi

