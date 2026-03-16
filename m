Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBE9396599
	for <sophgo@lists.linux.dev>; Mon, 16 Mar 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664644; cv=none; b=FrZUTa2RStLn2CkhcWnFvbJFe3rWXype4rTY305Z8ArTSKB53tZuwT6Uyc3KR9N54nKpvcJ7EnKb+uOKs7Z+teEP+mzk8oKzEBPsMnV6yS0gjqjh9oEJlQZq6/1vrgC7Cts1J1oNQKRFo0GHvQHk2Sdnf/EkLTTDHhgUxqGi2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664644; c=relaxed/simple;
	bh=ZgxUTmf9fVStVjRrnO2mMxCDQB5qTL/e7od6+V7IGEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxlMwlS1CGXqUfDl091qwZ9ioCq1Tm6ruCLEpTH4hoEmMN3vRAaE9hSyUhtGnImEhxA66Rl9mAl3ynyxAJItjPeDfm9JCLK0Pk0snSmTqgqDRjvQGDvpvEy5Gjh+AzhxK7k6STlpug9qTWW0tXt3/xv5wRiMIYBiYsgUWOet1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcLcSP48; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcLcSP48"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd71fb9f06so283759785a.2
        for <sophgo@lists.linux.dev>; Mon, 16 Mar 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664642; x=1774269442; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+43p1seL+R/O2hzNoObXrztoY0CvWOJdUHkcnpAiuU=;
        b=kcLcSP48hQPXCkuT/yUIs7ihvn+cZ0sc5zSUrVGY/S4flnzZpivlNiORbNdrrxd09u
         L49eCX50i/7rg9s1HYi/exhs1LTvtPt0/Bxc3hh49/AaEji/e1J4lRcmwJ0vH+SjncDw
         rOJQaeqcmL60j5xc44o7+1vEi6qvaeq2M5oVPmMcIBNnXAmQruuOWz7Ftph+3e9RtsVh
         ErdQ68mi85T0Xkbz02+5AXKR3pV5GRulN18hHWoN+x+5QQQBoK3GpEXafnpzS7p4VFfE
         z327b/gMoF8e1p/zKL6570/21SR4dFfQoqJw9Ozbi6oeHvE6UJkNV7LAIbWmEfDhYBRV
         H+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664642; x=1774269442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+43p1seL+R/O2hzNoObXrztoY0CvWOJdUHkcnpAiuU=;
        b=Cst8tikS5Vv4TcLy0426WpEzC9q/wCOwUscl7pV8O1ngZmtbYouACYEMkt3eiSurxp
         W7KDTMAmf9UibGjMT3F2OYl1uxWPKpbMp7+8w+iXN6iPsuuY2Ogo+m0gwhLBBC4e6dZr
         Xt9Zt/IiDkMd2QD2X4yWs26VHgB8PQOIGWGsH/AzU8JThU3+OpsOWR0LY5FdwkfO9/gr
         hb9Wq52RI0nuYNkg1NZ/n03IKeHzqVezbQlUGlF/C5fgoC9zaKqBLXxb9wM5E/1v9q3l
         KZFyTzlTMzD8al49wISBofhy+mrTViISWfT0usRhppJyKDAX8IvzYhOugMquhIOJbu+Z
         xlWg==
X-Forwarded-Encrypted: i=1; AJvYcCWopYCg342PMw9RqWjLTOaMfAOuN7mhEiXg62wtAI16zHbNeSCFOUhA1oJzpc8m7Fp/FN3/n8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDOzj8RutINL210QG7mWob9nR+VLAKNJB18nNFr4QKw1rHMcao
	cnaneYXVRpBAa3VKGp1YA3W4M+MtnFwjsHkCVUpbtS6N6LlTMBOC0Jo+
X-Gm-Gg: ATEYQzz+Jz3k34EsJKHMckp0GoUIkxHXkhmxOJbrOqsHxTM3o8fbNLMoEFQpXANkU5/
	cJWVY5Es8aoI2wJz2OYO3/8Lyw1dxpI0/z+uuxz6QEHwwH43Szo68E5nlw4DZJ0971AtjDRXpc/
	f381Z2RRs/zM137lFhncRb3cQJ4+XgSOT7jr7Cgv6wwmbaQrkYwesexcl5DEiX801OvPyUu7Cw6
	cKG3vJctnXCdvR0LHViSEet3K3Ncy3WD/g5f/XPn+Ze3zgs1BtO03c5mavmWTkDd1vav1z63otB
	sFKubERvptnkbZnhEWNpxcIwCqnMDqC8yg+mifd16baFa6/YQblf0ukXgA/ngkYCQQeb3XA1xW0
	7mFz8p8lHW9ba7+oujaJ1RrCF/GKtikHiNdZmxpy4O1sOqQbCvvY6sVEwrAx50eTy+i5NOJP4cW
	ERY8Bg1mdvLY5UDEB/RB6ZMEMFi+r1w1QcDtOPEC7NtxwDCGzx1xAGZzSI
X-Received: by 2002:a05:620a:2912:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cdb59eb46fmr1602679485a.6.1773664642445;
        Mon, 16 Mar 2026 05:37:22 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2148400sm1214055685a.39.2026.03.16.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:37:22 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:37:19 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <abf5fw5wdsfdNV8G@sleek>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-2-josh.milas@gmail.com>
 <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>

Hi Krzysztof,

Apologies for missing the change, I got ahead of myself.
I updated my changelog for an upcoming v4 patch.

> How did you resolve previous comments on bindings? Nothing mentioned
> here.

Which issues specifically? i2c issues were resolved by updating the 
.config for drivers. I have yet to resolve the spi issues.

Have a good day,
- Joshua Milas
