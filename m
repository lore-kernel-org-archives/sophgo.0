Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEFC8E6
	for <sophgo@lists.linux.dev>; Mon,  8 Sep 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351617; cv=none; b=nH6HQPY257QKs2yVn9Nk2NuTtIfbKpJk7G8WbC/5UeOsnU/5GxfPJqhSJzVSJioeh4sWF5+X9uBxgpXClviwRMbn5F7MYsLs+yhFsZnoZPFHEX5wahkvISK5nqQrXmYkax7Jgr2uAh5p0TFjNRTMPTsQ+uork4AUpY6woQZHVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351617; c=relaxed/simple;
	bh=Ary2qEdINuj3SFVzWL6vHBjiROpx9PRgOxSO6BA+PFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=J6+M/LRq//zxetf2JMbrUwocIHHIS+Cpiq4OuMBtpPC75TwSMMPFXoEU7gs33+fEZhqg5mZTq3VCg+1sgrGVsjk0tDJjxgFZXB1imtD5sEhy2RDGjujm9BtVKxzcUoapbd6LxDBymT8KvSe5zAoQVCqc6m5oZ9nvT7TQ87XWS0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwhXHDpF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwhXHDpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
	b=cwhXHDpFSCOi9Zgu9pf24LHC7o3dn1E1x75o/G6Gm7HHbiaQXipfJpRYg3ppG1FWFoqd4w
	5bBBSOQ/6evyFdUbt202uhXzcZSTDMklqkFl+IswcEICVez05kvL39MBocwUBm53ntdlMN
	t9QV3K/7g9UCIkMBmltfVP/kJzYIwyo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-m13c-_zhON-_EiXb4wh9tQ-1; Mon, 08 Sep 2025 13:13:33 -0400
X-MC-Unique: m13c-_zhON-_EiXb4wh9tQ-1
X-Mimecast-MFC-AGG-ID: m13c-_zhON-_EiXb4wh9tQ_1757351613
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-812ae9acaecso719045285a.1
        for <sophgo@lists.linux.dev>; Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351613; x=1757956413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
        b=WtF+m1W3CkTZRJxEwv6bcIWfolIYy7CyewOGrqoBwbtLJqBTegIOD2XMRFZXofw9zi
         rrSUnVBh7Y8IcBl2PncZKLfA3hHC1w8As/v0Bs5l92adK6Z+02smpL5KY9oivRKyp5Y/
         t7770yzFRLLSrkI5UErB/7Pv8rU6HpE1MfaFob7tHXGm5k4qXW0RB9gULB8RkWd58Mpv
         kJvuUPb0bO1282c0yHwoJNplla2OxwMYt4zSIoA7WWP01CazcCVF0LqTFsqurC5rcAwe
         ZObKCtl0f07EQASi+c7sDMWEiSR8wNy5qvOWgk6iLvTAqQ7SGIMH7++f+OofupSl/ox/
         494g==
X-Forwarded-Encrypted: i=1; AJvYcCVF74U2zHM9En1xnRZsnfUatSC0L5qMXwAAlFUvmrk396Qj6UOXPtVcXhDIv/4Z3tPjHTngH90=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMV+pOEN7gy0yvx515e3YAokK2DVVaRUG1/tZLUM4gP38JLXv/
	HmB8Vk68iNORV3yMiiW2z9Q5hkUm4h71Y98fdpc4RWdB2lGeCKNt8hTmQS0pqs78smHltKHtljU
	v9DWwHFMvv+DaICdq+m7iLUOhdCxtWgUfYks/5AwlcRAfLJh37VE5zIwpfQ==
X-Gm-Gg: ASbGncujF9wW/SDR5TG1/Tt6GY5/4Ftg2N1NgJR65omd0pLY4UrlKFo7+kzoYn1UvL/
	q4/C3pnkg0tqZWYNDMGbNSGUXVna7EEPZJC/pnnNxttfDrAp+DgPhiotu0OboqpbiukAPET1CbA
	cHqQhGOjIrIYrhfQwnTa6hx7bOv8Lup4SrpdL0Pj2W4umnUwyVVNn3CmW4v467vH2ORKfQkjhwc
	BnELtlM6cB/neE3+T5lFFigietW0NUASDmR15N1PVI9UKfXlrQqD5Y9WyjsK5oRMFD3SfGj+7QF
	kS/kU3SxGfh6HZ+mxNf0Z4+CcbQaudZ4w9y6qhanwum4qBBuPlxbtQ9DmhQ=
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818167085a.30.1757351613091;
        Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjCX6nGjgyfHMIgtZhE/2SgJwH/cNIdfnPyghhVtQtsXFicJtDPEijNhBgIwhV/6KVPSFsmg==
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818162785a.30.1757351612499;
        Mon, 08 Sep 2025 10:13:32 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm1108360485a.60.2025.09.08.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:13:31 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:13:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Message-ID: <aL8OuWjlswr95xcB@x1>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xDBZ0BO8wDAWjEUSumQW1AMQKp_bRc7RAsJEGNKQSZg_1757351613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 08:38:19PM -0400, Brian Masney wrote:
> Here's a minor v2 to my larger 114 patch series at
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
> that only includes 8 patches where a v2 was needed. To reduce the noise
> in everyone's mailboxes I'm not including the other 106 patches that are
> still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
> other cover letter to exclude the patches in this series.
> 
> This series has no dependencies and can be applied in any order.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

